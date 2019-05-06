import 'package:flutter/material.dart';

class Destory extends StatefulWidget {
  Widget child;
  VoidCallback despose;
  Destory({this.child, this.despose});
  @override
  _DestoryState createState() => _DestoryState();
}

class _DestoryState extends State<Destory> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void dispose() {
    super.dispose();
    if(widget.despose != null)
      widget.despose();
  }
}
