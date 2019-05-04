import 'package:flutter/material.dart';
import '../router.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class SubjectDetail extends Page {
  Map params;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  PageRoute build(Map params, NoRoute router) {
    return PageRouteBuilder(pageBuilder: (ctx, _, __){
      return SafeArea(
        child: WebviewScaffold(
          url: "https://www.baidu.com",
          userAgent: "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36",
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          initialChild: Container(
            color: Colors.redAccent,
            child: const Center(
              child: Text('Waiting.....'),
            ),
          ),
        ),
      );
    });
  }
}
