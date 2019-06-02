import 'package:flutter/material.dart';
import 'package:my_demo/root/me_list.dart';
import 'package:my_demo/root/notice_list.dart';

class RootList extends StatelessWidget {
  RootList({Key key}) : super(key: key);

  void _pressBtn(int idx, BuildContext context, var pageTitle) {
    var pages = [
      MeList(title:pageTitle),
      NoticeList(title:pageTitle),
    ];

    if (pages[idx] != null) {
      Navigator.push(context, new MaterialPageRoute(builder: (context) {
        return pages[idx];
      }));
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = "root";
    final List<String> items = [
      '我的Demo',
      '通知',
    ];

    return MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          //列表长度
          itemCount: items.length,
          //列表项构造器
          itemBuilder: (context, index) {
            return new ListTile(
              leading: new IconButton(
                icon: Icon(Icons.settings_input_svideo,
                  size: 28.0,
                ),
                onPressed: () {
                  _pressBtn(index, context, items[index]);
                },
              ),
              title: new Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}
