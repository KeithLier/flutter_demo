import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:ui' show lerpDouble;
import 'dart:math';
import 'color_palette.dart';
import 'tween.dart';


class BarChart {

  final List<BarStack> stacks;
  BarChart(this.stacks);

  factory BarChart.empty(Size size) {
    return new BarChart(
        <BarStack>[]
    );
  }

  factory BarChart.random(Size size,Random random){
    const barWidthFraction = 0.75;
    final ranks = selectRanks(random, 10);
    final barCount = ranks.length;
    final barDistance = size.width / (1+barCount);
    final barWidth = barDistance * barWidthFraction;
    final startX = barDistance - barWidth/2;
    final stacks = new List.generate(
      barCount,
        (i) {
          final barRanks = selectRanks(random, ColorPalette.primary.length ~/ 2);
          final bars = new List.generate(
            barRanks.length,
            (j) => new Bar(
              barRanks[j],
              random.nextDouble() * size.height / 2,
              ColorPalette.primary[barRanks[j]],
            )
          );
          return new BarStack(
              ranks[i],
              startX + i * barDistance,
              barWidth,
              bars
          );
        }
    );
    return new BarChart(
      stacks
    );
  }

  static List<int> selectRanks(Random random, int cap) {
    final ranks = <int>[];
    var rank = 0;
    while(true) {
      rank += random.nextInt(2);
      if(cap <= rank)
        break;
      ranks.add(rank);
      rank++;
    }
    return ranks;
  }
}

class BarChartTween extends Tween<BarChart> {
  BarChartTween(BarChart begin, BarChart end)
      : _stacksTween = new MergeTween<BarStack>(begin.stacks, end.stacks),
        super(begin: begin, end: end);

  final MergeTween<BarStack> _stacksTween;

  @override
  BarChart lerp(double t) => new BarChart(
    _stacksTween.lerp(t)
  );
}


class BarStack implements MergeTweenable<BarStack> {

  BarStack(this.rank, this.x, this.width, this.bars);

  final int rank;
  final double x;
  final double width;
  final List<Bar> bars;

  @override
  // TODO: implement empty
  BarStack get empty => new BarStack(rank, x, 0.0, <Bar>[]);

  @override
  bool operator <(BarStack other) {
    // TODO: implement <
    return rank < other.rank;
  }

  @override
  Tween<BarStack> tweenTo(BarStack other) {
    // TODO: implement tweenTo
    return new BarStackTween(this, other);
  }
}

class BarStackTween extends Tween<BarStack> {
  BarStackTween(BarStack begin, BarStack end)
    :_barTween = new MergeTween<Bar>(begin.bars, end.bars),
  super(begin:begin, end: end) {
    assert(begin.rank == end.rank);
  }

  final MergeTween<Bar> _barTween;

  @override
  BarStack lerp(double t) {
    // TODO: implement lerp
    return new BarStack(
        begin.rank,
        lerpDouble(begin.x, end.x, t),
        lerpDouble(begin.width, end.width, t),
        _barTween.lerp(t)
    );
  }
}

class Bar extends MergeTweenable<Bar>{
  Bar(this.rank, this.height, this.color);
  final int rank;
  final double height;
  final Color color;

  @override
  // TODO: implement empty
  Bar get empty => new Bar(rank, 0.0, color);

  @override
  bool operator <(Bar other) {
    // TODO: implement <
    return rank < other.rank;
  }

  @override
  Tween<Bar> tweenTo(Bar other) {
    // TODO: implement tweenTo
    return new BarTween(this, other);
  }

  static Bar lerp(Bar begin, Bar end, double t) {
    assert(begin.rank == end.rank);
    return new Bar(
        begin.rank,
        lerpDouble(begin.height, end.height, t),
        Color.lerp(begin.color, end.color, t)
    );
  }
}

class BarTween extends Tween<Bar> {
  BarTween(Bar begin, Bar end) : super(begin:begin, end: end) {
    assert(begin.rank == end.rank);
  }

  
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
    final linePaint = new Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 1.0;
    final linePath = new Path();
    final chart = animation.value;
    for(final stack in chart.stacks) {
      var y = size.height;
      for (final bar in stack.bars) {
        paint.color = bar.color;
        canvas.drawRect(
            new Rect.fromLTWH(
                stack.x,
                y - bar.height,
                stack.width,
                bar.height
            ),
            paint
        );
        if(y < size.height) {
          linePath.moveTo(stack.x, y);
          linePath.lineTo(stack.x + stack.width, y);
        }
        y -= bar.height;
      }
      canvas.drawPath(linePath, linePaint);
      linePath.reset();
    }
  }

  @override
  bool shouldRepaint(BarChartPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
