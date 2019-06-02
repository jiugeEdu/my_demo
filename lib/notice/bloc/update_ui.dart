import 'package:flutter/material.dart';
import 'package:my_demo/notice/bloc/test_ui1.dart';
import 'package:my_demo/uiutils/ui_utils.dart';

class UpdateUI extends StatefulWidget {
  final String title;
  UpdateUI({
    Key key,
    this.title
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}


class _PageState extends State < UpdateUI > {
  final List < String > items = [
    '测试 1',
  ];

  void _pressBtn(int idx, BuildContext context,
    var pageTitle) {
    var pages = [
      TestUI1(),
    ];

    if (pages[idx] != null) {
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return pages[idx];
      }));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
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
      ),
    );
  }


}