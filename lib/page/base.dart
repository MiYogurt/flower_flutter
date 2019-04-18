import 'package:flutter/material.dart';
import '../layout/layout.dart' as layout;
import '../router.dart';

typedef Widget BuildFn(BuildContext ctx, Map params, NoRoute router);

class BodyPage extends Page {
  BuildFn _build;
  build(Map params, router) {
   return MaterialPageRoute(builder: (ctx){
      return Scaffold(
        appBar: layout.appBar(),
        body: _build(ctx, params, router),
        drawer: layout.drawer(ctx)
      );
    });
  }

  BodyPage.formBuild(BuildFn build) {
    _build = build;
  }
}