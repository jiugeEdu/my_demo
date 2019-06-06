import 'package:flutter/material.dart';
import 'package:my_demo/notice/bloc/base_mgr.dart';

abstract class BaseWidget extends StatefulWidget {
  const BaseWidget({ Key key }) : super(key: key);
}


@optionalTypeArgs
abstract class BaseUI<T extends StatefulWidget>  extends State {
  String _stateId;

  BaseUI() {
    _stateId = BaseMgr().generateStateId();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    BaseMgr().removeStateId(_stateId);
    super.dispose();
  }


  String getStateId() {
    return _stateId;
  }


  @protected
  void reveiveNotice(dynamic data, {
    int dataType
  }) {
  }

  @protected
  void reveiveAllNotice(dynamic data) {
  }
}