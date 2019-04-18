import 'package:flutter/material.dart';
import 'base.dart';

var User = () => BodyPage.formBuild((ctx, params, router){
  return Container(
    child: GestureDetector(
      child: Text("goto Home"),
      onTap: (){
        router.to(ctx, '/', {});
      },
    ),
  );
});