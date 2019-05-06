import 'package:flower_shop/model/subject.dart' as m;
import 'package:flower_shop/page/base.dart';
import 'package:flower_shop/widgets/card.dart';
import 'package:flower_shop/widgets/list.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../test_db/subject.dart' as db;
import '../model/subject.dart';
import '../layout/layout.dart' as layout;
import '../router.dart';
import '../path.dart' as Path;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class _Subject extends StatefulWidget {
  @override
  __SubjectState createState() => __SubjectState();
}

class __SubjectState extends State<_Subject> {
  static List<m.Subject> subjects = db.subjects;
  RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
  }

  Widget list() {
    return ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (ctx, index) {
          var subject = subjects[index];
          return GestureDetector(
            onTap: () {
              route.to(ctx, Path.SubjectDetail, {});
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: boxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: subject.imgUrl,
                    fit: BoxFit.cover,
                    height: 130,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(subject.name),
                  )
                ],
              ),
            ),
          );
        });
  }

  onRefresh() {
    print('reload');
    setState(() {
      subjects.add(m.Subject(1, "test",
          "https://st-gdx.dancf.com/gaodingx/8/design/20190416-104501-cd9f.png?x-oss-process=image/resize,w_760/interlace,1"));
      refreshController.refreshCompleted();
    });
  }

  onLoading() {
    setState(() {
      Future.delayed(Duration(seconds: 2)).then((_){
        subjects.add(m.Subject(1, "test",
            "https://st-gdx.dancf.com/gaodingx/8/design/20190416-104501-cd9f.png?x-oss-process=image/resize,w_760/interlace,1"));
        refreshController.loadComplete();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SmartRefresher(
      child: list(),
      enablePullUp: true,
      header: ClassicHeader(
        idleIcon: Container(),
        releaseText: '释放后刷新',
        refreshingText: '刷新中...',
        completeText: '刷新完成',
        failedText: '刷新失败',
        idleText: '继续下拉进行刷新',
      ),
      footer: ClassicFooter(
        loadingText: '加载中...',
        idleText: "载入更多"
      ),
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
    ));
  }
}

var Subject = () => BodyPage.formBuild((ctx, param, router) {
      return _Subject();
    });
