import 'package:flutter/material.dart';
import 'dart:math';

class BoxPainter extends CustomPainter {
  double radius;
  Color color;

  BoxPainter({this.radius = 10, this.color = Colors.black54});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawArc(
        Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
        0,
        2 * pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RightPainter extends CustomPainter {
  Color color;
  double scale;

  RightPainter({this.color = Colors.deepOrange, this.scale});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2 * scale;
    var path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.5, size.height * 0.7);
    path.lineTo(size.width * 0.8, size.height * 0.3);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AppCheckBox extends StatefulWidget {
  bool value;
  ValueChanged<bool> onChanged;
  double width;
  double height;
  Color activeColor;

  AppCheckBox(
      {this.value = false,
        this.onChanged,
        this.width = 20,
        this.height = 20,
        this.activeColor = Colors.deepOrange});

  @override
  _AppCheckBoxState createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox>
    with TickerProviderStateMixin<AppCheckBox> {
  AnimationController controller;
  Animation<double> scale;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    scale = Tween<double>(begin: 0, end: 1).animate(controller);
    super.initState();
  }

  show(){
    return controller.forward();
  }

  hidden(){
    return controller.reverse();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    if (widget.value) {
      show();
    }
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  runChanged() {
    if (widget.onChanged != null) widget.onChanged(!widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          if (widget.value) {
            // 先 hidden 再执行
            hidden().whenComplete(runChanged);
            return;
          }
          // 直接更新
          runChanged();
        },
        child: AnimatedBuilder(
            animation: controller,
            builder: (ctx, _) {
              print("scale: " + scale.value.toString());
              return CustomPaint(
                foregroundPainter:
                widget.value ? RightPainter(scale: scale.value) : null,
                painter: BoxPainter(
                    color: widget.value ? widget.activeColor : Colors.grey),
                size: Size(widget.width, widget.height),
              );
            }),
      ),
    );
  }
}