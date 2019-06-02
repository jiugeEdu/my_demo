import 'package:flutter/material.dart';
import 'package:my_demo/uiutils/ui_utils.dart';

class TestUI1 extends StatefulWidget {
  TestUI1({
    Key key,
  }): super(key: key);

  @override
  _PageState createState() => new _PageState();
}



class _PageState extends State < TestUI1 > {
  String _keyStr = 'key';

  void _printKey() {
  }


  @override
  void initState() {
    super.initState();
    this._keyStr = widget.key.toString();

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('test1'),
      ),
      body:ListView(
        children: <Widget>[
          UIUtills.getDisplayText(_keyStr==null?'null' : _keyStr),
          SizedBox(height: 30,),
          UIUtills.getTextBtn('no', _printKey),
        ],
      ),
    );
  }


}