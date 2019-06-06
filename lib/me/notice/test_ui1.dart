import 'package:flutter/material.dart';
import 'package:my_demo/uiutils/ui_utils.dart';
import 'package:my_demo/me/notice/me_state.dart';
import 'package:my_demo/me/notice/me_state_mgr.dart';

class TestUI1 extends StatefulWidget {
  TestUI1({
    Key key,
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}



class _PageState extends MeState < TestUI1 > {
  final kName = 'test_ui1';
  String noticeText = 'noticeText';

  void _send3() {
    MeStateMgr().sendNotice('update_ui', kName);
  }
  void _sendAll() {
    MeStateMgr().sendAllNotice('ui1 send all');
  }


  @override
  void initState() {
    super.initState();
    MeStateMgr().registerNotice(kName, this);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('test1'),
      ),
      body: ListView(
        children: < Widget > [
          UIUtills.getDisplayText(noticeText),
          SizedBox(height: 30, ),
          UIUtills.getTextBtn('发送通知3', _send3),
          UIUtills.getTextBtn('发送通知all', _sendAll),
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
  }) {}

  @override
  void reveiveAllNotice(data) {
    noticeText = data.toString();
    setState(() {});
  }
}