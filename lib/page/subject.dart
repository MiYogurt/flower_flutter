import 'package:flower_shop/page/base.dart';
import 'package:flutter/material.dart';
import '../model/subject.dart';
import '../layout/layout.dart' as layout;
import '../router.dart';

class _Subject extends StatefulWidget {
  @override
  __SubjectState createState() => __SubjectState();
}

class __SubjectState extends State<_Subject> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text("hello Subject"),
      ),
    );
  }
}

var Subject = () => BodyPage.formBuild((ctx, param, router){
  return _Subject();
});

