import 'package:flutter/material.dart';

abstract class Page {
  Map params;
  PageRoute build(Map params, NoRoute router);
}

class NoRoute{
  Map<String, Page> pages = {};
  add(String path, Page page){
    pages.addAll({path: page});
  }

  to(BuildContext ctx, String path, Map params){
    Navigator.of(ctx).pushNamed(path, arguments: params);
  }
}
