import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/animation.dart';
import 'dart:ui' show lerpDouble;

class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationState();
  }
}

class AnimationState extends State<AnimationPage> with TickerProviderStateMixin {
  
  final random = new Random();
  int dataSet = 50;
  AnimationController animation;
  double startHeight;
  double currentHeight;
  double endHeight;

  @override
  void initState() {
    super.initState();
    animation = new AnimationController(
      duration: const Duration(milliseconds: 300), vsync: this
    )
    ..addListener((){
      setState(() {
        currentHeight = lerpDouble(startHeight, endHeight, animation.value);
      });
    });
    startHeight = 0.0;
    currentHeight = 0.0;
    endHeight = dataSet.toDouble();
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      startHeight = currentHeight;
      dataSet = random.nextInt(100);
      endHeight = dataSet.toDouble();
      animation.forward(from: 0.0);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Animation'),
        backgroundColor: Colors.grey[200],
      ),
      body: new Center(
        child: new CustomPaint(
          size: new Size(200.0, 100.0),
          painter: new BarChartPainter(currentHeight),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: changeData,
        child: new Icon(Icons.refresh),
      ),
    );
  }
}


class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;

  BarChartPainter(this.barHeight);
  // ignore: missing_function_body
  final double barHeight;

  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
        ..color = Colors.blue[400]
        ..style = PaintingStyle.fill;
    canvas.drawRect(
      new Rect.fromLTWH(size.width-barWidth/2.0, size.height-barHeight, barWidth, barHeight),
    paint);
  }

  @override
  bool shouldRepaint(BarChartPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return barHeight != oldDelegate.barHeight;
  }
}
