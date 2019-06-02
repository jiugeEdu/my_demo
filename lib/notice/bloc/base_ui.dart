import 'package:flutter/material.dart';


class BaseUI<T extends StatefulWidget> extends State {


  @override
  void initState() {
    super.initState();
    widget.key.toString();
  }


  @override
  Widget build(BuildContext context) {
    return null;
  }


  @override
  void dispose() {
    super.dispose();
  }


}