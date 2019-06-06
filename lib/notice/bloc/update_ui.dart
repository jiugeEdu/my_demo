import 'package:flutter/material.dart';
import 'package:my_demo/notice/bloc/test_ui1.dart';
import 'package:my_demo/notice/bloc/test_ui2.dart';
import 'package:my_demo/uiutils/ui_utils.dart';
import 'package:my_demo/notice/bloc/me_state.dart';
import 'package:my_demo/notice/bloc/me_state_mgr.dart';

class UpdateUI extends StatefulWidget {
  final String title;
  UpdateUI({
    Key key,
    this.title
  }): super(key: key);

  @override
  _PageState createState() => new _PageState(this.title);
}


// class _PageState extends State < UpdateUI > {
class _PageState extends MeState < UpdateUI > {
  final String title;
  _PageState(this.title);

  final kName = 'update_ui';
  String _initData = 'init_data';
  final List < String > items = [
    '测试1',
    '测试2',
  ];

  void _pressBtn(int idx, BuildContext context,
    var pageTitle) {
    var pages = [
      TestUI1(),
      TestUI2(),
    ];

    if (pages[idx] != null) {
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return pages[idx];
      }));
    }
  }


  void _printNotice() {
    MeStateMgr().printNotice();
  }
  void _sendAll() {
    MeStateMgr().sendAllNotice('update to all');
  }


  @override
  void initState() {
    super.initState();
    MeStateMgr().registerNotice(kName, this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Column(
        children: < Widget > [
          UIUtills.getDisplayText(_initData),
          SizedBox(height: 5,),
          UIUtills.getTextBtn('打印key', _printNotice),
          UIUtills.getTextBtn('发送通知all', _sendAll),
          Expanded(
            child: _getBuilder(context),
          ),
        ],
      ),
    );
  }


  Widget _getBuilder(BuildContext pContext) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: IconButton(
            icon: Icon(Icons.settings_input_svideo, size: 28.0, ),
            onPressed: () {
              _pressBtn(index, context, items[index]);
            },
          ),
          title: Text('${items[index]}'),
        );
      },
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
    _initData = data.toString();
    setState(() {});
  }

  @override
  void reveiveAllNotice(data) {
    _initData = data.toString();
    setState(() {});
  }
}