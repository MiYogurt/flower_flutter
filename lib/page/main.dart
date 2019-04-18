import 'package:flutter/material.dart';
import '../layout/layout.dart' as layout;
import '../router.dart';

class Main extends Page {
  build(Map params, router) {
   return MaterialPageRoute(builder: (ctx){
      return Scaffold(
        appBar: layout.appBar(),
        body: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Text("to other"),
            FlatButton(child: Text("to other!"),onPressed: (){
              router.to(ctx, '/other', {"hello":"world"});
            })
          ],
        ),
        drawer: layout.drawer(ctx)
      );
    });
  }
}