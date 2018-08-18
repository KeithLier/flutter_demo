import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/animation.dart';
import 'bar.dart';

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
  BarTween tween;

  @override
  void initState() {
    super.initState();
    animation = new AnimationController(
      duration: const Duration(milliseconds: 300), vsync: this
    );
    tween = new BarTween(new Bar.empty(), new Bar.random(random));
    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void changeData() {
    setState(() {
      tween = new BarTween(
        tween.evaluate(animation),
        new  Bar.random(random),
      );
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
          painter: new BarChartPainter(tween.animate(animation)),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: changeData,
        child: new Icon(Icons.refresh),
      ),
    );
  }
}

