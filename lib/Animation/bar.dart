import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:ui' show lerpDouble;
import 'dart:math';
import 'color_palette.dart';

class BarChart {
  static const int barCount = 7;
  final List<Bar> bars;
  BarChart(this.bars);

  factory BarChart.empty(Size size) {
    return new BarChart(
        <Bar>[]
    );
  }

  factory BarChart.random(Size size,Random random){
    const barWidthFraction = 0.75;
    const minBarDistance = 20.0;
    // floor()：返回不大于此的最大整数
    final barCount = random.nextInt((size.width/minBarDistance).floor()) + 1;
    final barDistance = size.width / (1+barCount);
    final barWidth = barDistance * barWidthFraction;
    final startX = barDistance - barWidth/2;
    final color = ColorPalette.primary.random(random);
    final bars = new List.generate(
      barCount,
        (i) => new Bar(
          startX + i *barDistance,
          barWidth,
          random.nextDouble() * size.height,
          color,
        ),
    );
    return new BarChart(
      bars
    );
  }

  static BarChart lerp(BarChart begin, BarChart end, double t) {
    final barCount = max(begin.bars.length, end.bars.length);
    final bars = new List.generate(
      barCount,
        (i) => Bar.lerp(
          begin._barOrNull(i) ?? end.bars[i].collapsed,
          end._barOrNull(i) ?? begin.bars[i].collapsed,
          t,
        )
    );
    return new BarChart(
        bars
    );
  }

  Bar _barOrNull(int index) {
    return (index<bars.length ? bars[index] : null);
  }
}

class BarChartTween extends Tween<BarChart> {
  BarChartTween(BarChart begin, BarChart end) : super(begin: begin, end: end);
  @override
  BarChart lerp(double t) => BarChart.lerp(begin, end, t);
}

class Bar {
  Bar(this.x, this.width, this.height, this.color);
  final double x;
  final double width;
  final double height;
  final Color color;
  Bar get collapsed => new Bar(x, 0.0, 0.0, color);

  static Bar lerp(Bar begin, Bar end, double t) {
    return new Bar(
        lerpDouble(begin.x, end.x, t),
        lerpDouble(begin.width, end.width, t),
        lerpDouble(begin.height, end.height, t),
        Color.lerp(begin.color, end.color, t)
    );
  }
}

class BarTween extends Tween<Bar> {
  BarTween(Bar begin, Bar end) : super(begin:begin, end: end);
  
  @override
  Bar lerp(double t) {
    // TODO: implement lerp
    return Bar.lerp(begin, end, t);
  }
}

class BarChartPainter extends CustomPainter {
  static const barWidthFraction = 0.75;
  static const barWidth = 10.0;

  BarChartPainter(Animation<BarChart> animation)
      :animation = animation,
        super(repaint: animation);
  final Animation<BarChart> animation;

  void paint(Canvas canvas, Size size) {
    /*
    Paint：Canvas绘制时使用的样式说明
      style：是否绘制内部的形状、形状的边缘或两者都有，默认为PaintingStyle.fill
     */
    final paint = new Paint()..style = PaintingStyle.fill;
    final chart = animation.value;
    for(final bar in chart.bars) {
      paint.color = bar.color;
      canvas.drawRect(
        new Rect.fromLTWH(
          bar.x,
          size.height - bar.height,
          bar.width,
          bar.height
        ),
        paint
      );
    }
  }

  @override
  bool shouldRepaint(BarChartPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
