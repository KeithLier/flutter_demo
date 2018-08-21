import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:ui' show lerpDouble;
import 'dart:math';
import 'color_palette.dart';
import 'tween.dart';


class BarChart {

  final List<BarGroup> groups;
  BarChart(this.groups);

  factory BarChart.empty(Size size) {
    return new BarChart(
        <BarGroup>[]
    );
  }

  factory BarChart.random(Size size,Random random){
    const groupWidthFraction = 0.75;
    const barWidthFraction = 0.9;
    final groupRanks = selectRanks(random, 5);
    final groupCount = groupRanks.length;
    final groupDistance = size.width / (1+groupCount);
    final groupWidth = groupDistance * groupWidthFraction;
    final startX = groupDistance - groupWidth/2;
    final barRanks = selectRanks(random, ColorPalette.primary.length ~/ 2);
    final barCount = barRanks.length;
    final barDistance = groupWidth / barCount;
    final barWidth = barDistance * barWidthFraction;
    final groups = new List.generate(
      groupCount,
        (i) {
          final bars = new List.generate(
              barCount,
              (j) => new Bar(
                barRanks[j],
                startX + i * groupDistance + j * barDistance,
                barWidth,
                random.nextDouble() * size.height,
                ColorPalette.primary[barRanks[j]],
              )
          );
          return new BarGroup(
              groupRanks[i],
              bars
          );
      }
    );
    return new BarChart(
      groups
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
      : _groupsTween = new MergeTween<BarGroup>(begin.groups, end.groups),
        super(begin: begin, end: end);

  final MergeTween<BarGroup> _groupsTween;

  @override
  BarChart lerp(double t) => new BarChart(_groupsTween.lerp(t));
}


class BarGroup implements MergeTweenable<BarGroup> {

  BarGroup(this.rank, this.bars);

  final int rank;
  final List<Bar> bars;

  @override
  // TODO: implement empty
  BarGroup get empty => new BarGroup(rank, <Bar>[]);

  @override
  bool operator <(BarGroup other) {
    // TODO: implement <
    return rank < other.rank;
  }

  @override
  Tween<BarGroup> tweenTo(BarGroup other) {
    // TODO: implement tweenTo
    return new BarGroupTween(this, other);
  }
}

class BarGroupTween extends Tween<BarGroup> {
  BarGroupTween(BarGroup begin, BarGroup end)
      : _barsTween = new MergeTween<Bar>(begin.bars, end.bars),
        super(begin: begin, end: end) {
    assert(begin.rank == end.rank);
  }

  final MergeTween<Bar> _barsTween;

  @override
  BarGroup lerp(double t) {
    // TODO: implement lerp
    return new BarGroup(
        begin.rank,
        _barsTween.lerp(t)
    );
  }
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
  Bar(this.rank,this.x,this.width, this.height, this.color);
  final int rank;
  final double x;
  final double width;
  final double height;
  final Color color;

  @override
  // TODO: implement empty
  Bar get empty => new Bar(rank,x,0.0, 0.0, color);

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
        lerpDouble(begin.x, end.x, t),
        lerpDouble(begin.width, end.width, t),
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

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()..style = PaintingStyle.fill;
    final chart = animation.value;
    for(final stack in chart.groups) {
      for(final bar in stack.bars) {
        paint.color = bar.color;
        canvas.drawRect(
          new Rect.fromLTWH(
              bar.x,
              size.height - bar.height,
              bar.width,
              bar.height
          ),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(BarChartPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
