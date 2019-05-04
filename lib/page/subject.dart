import 'package:flower_shop/model/subject.dart' as m;
import 'package:flower_shop/page/base.dart';
import 'package:flower_shop/widgets/card.dart';
import 'package:flower_shop/widgets/list.dart';
import 'package:flutter/material.dart';
import '../test_db/subject.dart' as db;
import '../model/subject.dart';
import '../layout/layout.dart' as layout;
import '../router.dart';
import '../path.dart' as Path;

class _Subject extends StatefulWidget {
  @override
  __SubjectState createState() => __SubjectState();
}

class __SubjectState extends State<_Subject> {
  static List<m.Subject> subjects = db.subjects;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AList.builder(itemCount: subjects.length, itemBuilder: (ctx, index){
        var subject = subjects[index];
        return GestureDetector(
          onTap: (){
            route.to(ctx, Path.SubjectDetail, {});
          },
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: boxDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(subject.imgUrl),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(subject.name),
                )
              ],
            ),
          ),
        );
      })
    );
  }
}

var Subject = () => BodyPage.formBuild((ctx, param, router){
  return _Subject();
});

