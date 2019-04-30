import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

var IOSNavBar = (ctx) => Offstage(
    offstage: !Platform.isIOS,
    child: GestureDetector(
      onTap: () {
        var nav = Navigator.of(ctx);
        if (nav.canPop()) {
          nav.pop();
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(ctx).size.width - 20,
        color: Color.fromRGBO(244, 244, 244, 1),
        child: Row(
          children: <Widget>[
            SvgPicture.asset("assets/svg/left.svg", width: 20)
          ],
        ),
      ),
    ));