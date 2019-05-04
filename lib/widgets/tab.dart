import 'package:flutter/material.dart';

class ATab extends StatefulWidget {
  num initSelectedIndex = 0;
  void Function(num i) onTabSelected;
  List<Widget> childrens;
  List<String> tabs;

  @override
  _ATabState createState() => _ATabState();

  ATab(
      {this.initSelectedIndex = 0,
      this.onTabSelected,
      this.tabs,
      this.childrens});
}

class _ATabState extends State<ATab> {
  num _index;
  double opacity = 1;

  @override
  void initState() {
    super.initState();
    _index = widget.initSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    var duration = Duration(milliseconds: 500);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 50,
          width: double.infinity,
          child: Flex(
            direction: Axis.horizontal,
            children: List.generate(
                widget.tabs.length,
                (i) => Expanded(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              opacity = 0;
                              Future.delayed(duration).then((_){
                                setState(() {
                                  _index = i;
                                  opacity = 1;
                                });
                              });
                            });
                            if (widget.onTabSelected != null)
                              widget.onTabSelected(i);
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            color: i == _index
                                ? Colors.deepOrange
                                : Colors.white,
                            child: Text(
                              widget.tabs[i],
                              style: TextStyle(
                                  color: i == _index
                                      ? Colors.white
                                      : Colors.black87),
                            ),
                          )),
                    )),
          ),
        ),
        AnimatedOpacity(
            opacity: opacity,
            duration: duration,
            child: widget.childrens[_index]),
      ],
    );
  }
}
