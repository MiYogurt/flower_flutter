import 'package:flutter/material.dart';
import 'base.dart';
import 'package:photo_view/photo_view.dart';

var Photo = () => BodyPage.formBuild((BuildContext ctx, Map params, router) {
  return  Container(
      child: PhotoView(
        imageProvider: NetworkImage(params['url']),
      )
  );
}, noAnimate: false);
