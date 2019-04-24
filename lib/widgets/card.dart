import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {
  Widget child;

  CardBox({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        height: 120,
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.all(Radius.circular(6)),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Color.fromRGBO(233, 233, 233, 0.4),
                offset: Offset(1, 0),
                spreadRadius: 0,
              )
            ]),
        child: child
    );
  }
}
