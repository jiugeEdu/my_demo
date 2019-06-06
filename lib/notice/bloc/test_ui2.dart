import 'package:flutter/material.dart';
import 'package:my_demo/uiutils/ui_utils.dart';
import 'package:my_demo/notice/bloc/base_ui.dart';
import 'package:my_demo/notice/bloc/base_mgr.dart';

class TestUI2 extends StatefulWidget {
  TestUI2({
    Key key,
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}



class _PageState extends BaseUI < TestUI2 > {
  String noticeText = 'noticeText';
  final kName = 'test_ui2';

  void _send3() {
    BaseMgr().sendNotice('update_ui', kName);
  }
  void _send2() {
    BaseMgr().sendNotice(kName, 'test_ui2 to test_ui2');
  }
  void _printNotice() {
    BaseMgr().printNotice();
  }
  void _sendAll() {
    BaseMgr().sendAllNotice('ui2 send all');
  }


  @override
  void initState() {
    super.initState();
    BaseMgr().registerNotice(kName, this);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test2'),
      ),
      body:ListView(
        children: <Widget>[
          UIUtills.getDisplayText(noticeText),
          SizedBox(height: 30,),
          UIUtills.getTextBtn('发送通知3', _send3),
          SizedBox(height: 5,),
          UIUtills.getTextBtn('发送通知2', _send2),
          UIUtills.getTextBtn('发送通知all', _sendAll),
          SizedBox(height: 5,),
          UIUtills.getTextBtn('打印通知数据', _printNotice),
        ],
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  void reveiveNotice(data, {
    int dataType,
  }) {
    noticeText = data.toString();
    setState(() {});
  }


  @override
  void reveiveAllNotice(data) {
    noticeText = data.toString();
    setState(() {});
  }
}