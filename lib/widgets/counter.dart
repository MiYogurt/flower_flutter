import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  VoidCallback up;
  VoidCallback down;
  num count;
  double height;
  double iconSize = 18;
  EdgeInsets padding = EdgeInsets.all(0);
  Color gray = Color.fromRGBO(244, 244, 244, 1);
  double buttonWidth = 40;

  Counter({this.count = 0, this.up, this.down, this.height = 40});

  Widget button(VoidCallback onTap, IconData icon) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        color: gray,
        child: Icon(icon, size: iconSize),
      ),
    );
  }

  Widget counterLabel()
  {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: gray),
      ),
      child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 40),
          child: Text(
            count.toString(),
            textAlign: TextAlign.center,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          button(down, Icons.remove),
          counterLabel(),
          button(up, Icons.add),
        ],
      ),
    );
  }
}
