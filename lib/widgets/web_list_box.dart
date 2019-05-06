import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class WebListBox extends StatefulWidget {
  @override
  _WebListBoxState createState() => _WebListBoxState();
}

class _WebListBoxState extends State<WebListBox> {
  ScrollPhysics physics;
  bool isUp = false;
  ScrollController srollController;
  double screenHeight;

  @override
  void initState() {
    super.initState();
    physics = ScrollPhysics();
    srollController = ScrollController();
  }


  @override
  void dispose() {
    super.dispose();
    srollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Listener(
      onPointerMove: (e){
        isUp = e.delta.dy < 0;
        print("moved");
      },
      onPointerUp: (e){
        print("isUp : " + isUp.toString());
        if(isUp){
          if(srollController.position.pixels == srollController.position.maxScrollExtent){
            setState(() {
              physics = NeverScrollableScrollPhysics();
            });
          }
        }
      },
      child: ListView(
        controller: srollController,
        physics: physics,
        children: <Widget>[
          SizedBox(height: screenHeight),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  height: screenHeight,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: InAppWebView(
                    onWebViewCreated: (ctl){
                      ctl.injectScriptCode("""
                        console.log("test");
                        console.log(document.body)
                        document.body.onscroll = function(e){console.log(document.body.onscroll));
                        console.log(document.body.onscroll)
                      """);
                    },
                    onConsoleMessage: (InAppWebViewController ctl, ConsoleMessage consoleMessage){
                      print("message  xxxxxx = ");
                      print(consoleMessage.message);
                    },
                    onScrollChanged: (controller, int x, int y){
                      print("yyy "+ y.toString());
                      if(y == 0){
                        setState(() {
                          physics = ScrollPhysics();
                        });
                      }
                    },
                    initialUrl: "https://flutter.io/",
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class WebListBox2 extends StatefulWidget {
  @override
  _WebListBoxState2 createState() => _WebListBoxState2();
}

class _WebListBoxState2 extends State<WebListBox2> {
  ScrollPhysics physics;
  bool isUp = false;
  ScrollController srollController;
  double screenHeight;
  GlobalKey webContainer = GlobalKey();
  bool webViewPositionChanged = true; // 浏览器的位置发生了变动
  int prevY = 0; // 上一次的Y

  @override
  void initState() {
    super.initState();
    physics = AlwaysScrollableScrollPhysics();
    srollController = ScrollController();
  }

  double get prevContainerHeight { // 第一个容器的高度
    var renderBox = webContainer.currentContext.findRenderObject();
    return renderBox.semanticBounds.height;
  }

  bool get isDown => !(isUp);

  @override
  void dispose() {
    super.dispose();
    srollController.dispose();
  }

  // 修正滚动的位置
  void toWebViewTop(){
    srollController.animateTo(prevContainerHeight, duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Listener(
      onPointerMove: (e){
        isUp = e.delta.dy < 0;
      },
      onPointerUp: (e){
        if(
        physics is AlwaysScrollableScrollPhysics &&
            srollController.position.pixels >= prevContainerHeight  &&  // 滚动超过的第一个容器
            srollController.position.pixels - prevContainerHeight <= screenHeight // 在第二个容器 webview 之内
        ){
          toWebViewTop();
          setState(() {
            physics = NeverScrollableScrollPhysics();
          });
        } else {
          if(isUp){
            Future.delayed(Duration(milliseconds: 100)).then((_){
              if(
              physics is NeverScrollableScrollPhysics && // 处于不可滚动状态
                  !webViewPositionChanged // 没有 Y 发生改变
              ){
                setState(() {
                  physics = AlwaysScrollableScrollPhysics();
                });
              }
              webViewPositionChanged = false;
            });
          }
        }

      },
      child: ListView(
        controller: srollController,
        physics: physics,
        children: <Widget>[
          SizedBox(
              key: webContainer,
              height: 996
          ),
          Container(
              height: screenHeight,
              child: InAppWebView(
                onScrollChanged: (controller, int x, int y){
                  print("yyyy " + y.toString());
                  if(y <= 10){
                    setState(() {
                      physics = AlwaysScrollableScrollPhysics();
                    });
                    return;
                  }
                  if(y != prevY) webViewPositionChanged = true;
                  prevY = y;
                },
                initialUrl: "https://flutter.io/",
              )
          ),
          SizedBox(height: screenHeight),
        ],
      ),
    );
  }
}
