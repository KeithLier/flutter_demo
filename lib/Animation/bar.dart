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
    final ranks = selectRanks(random, ColorPalette.primary.length);
    const minBarDistance = 20.0;
    // floor()：返回不大于此的最大整数
    final barCount = ranks.length;
    final barDistance = size.width / (1+barCount);
    final barWidth = barDistance * barWidthFraction;
    final startX = barDistance - barWidth/2;
    final color = ColorPalette.primary.random(random);
    final bars = new List.generate(
      barCount,
        (i) => new Bar(
          ranks[i],
          startX + i *barDistance,
          barWidth,
          random.nextDouble() * size.height,
          ColorPalette.primary[ranks[i]],
        ),
    );
    return new BarChart(
      bars
    );
  }

  static List<int> selectRanks(Random random, int cap) {
    final ranks = <int>[];
    var rank = 0;
    while(true) {
      if(random.nextDouble() < 0.2)
        rank++;
      if(cap <= rank)
        break;
      ranks.add(rank);
      rank++;
    }
    return ranks;
  }

//  static BarChart lerp(BarChart begin, BarChart end, double t) {
//    final bars = <Bar>[];
//    final bMax = begin.bars.length;
//    final eMax = end.bars.length;
//    var b = 0;
//    var e = 0;
//    while(b + e < bMax + eMax) {
//      /*
//      这里的条件判断中包含两种情况
//      b < bMax && e == eMax：
//        当新图表条形数减少时
//      b < bMax && begin.bars[b] < end.bars[e]：
//        当新图表不包含旧图表的颜色条形时
//      满足一种情况，处理旧图表中多余的条形，即向左侧方清除旧条形
//       */
//
//      if(b < bMax && (e == eMax || begin.bars[b] < end.bars[e])) {
//        bars.add(Bar.lerp(begin.bars[b], begin.bars[b].collapsed, t));
//        b++;
//      } else if (e < eMax && (b == bMax || end.bars[e] < begin.bars[b])) {
//        /*
//      这里的条件判断中包含两种情况
//      e < eMax && b == bMax：
//        当新图表条形数增加时
//      e < eMax && end.bars[e] < begin.bars[b]：
//        当新图表包含旧图表没有的颜色条形时
//      满足一种情况，处理旧图表中没有的条形，即向右侧方绘制新条形
//       */
//        bars.add(Bar.lerp(end.bars[e], end.bars[e].collapsed, t));
//        e++;
//      } else {
//        bars.add(Bar.lerp(begin.bars[b], end.bars[e], t));
//        b++;
//        e++;
//      }
//    }
//    return new BarChart(
//        bars
//    );
//  }

  Bar _barOrNull(int index) {
    return (index<bars.length ? bars[index] : null);
  }
}

class BarChartTween extends Tween<BarChart> {
  final _tweens = <BarTween>[];

  BarChartTween(BarChart begin, BarChart end) : super(begin: begin, end: end) {
    final bMax = begin.bars.length;
    final eMax = end.bars.length;
    var b = 0;
    var e = 0;
    while(b + e < bMax + eMax) {
      /*
      这里的条件判断中包含两种情况
      b < bMax && e == eMax：
        当新图表条形数减少时
      b < bMax && begin.bars[b] < end.bars[e]：
        当新图表不包含旧图表的颜色条形时
      满足一种情况，处理旧图表中多余的条形，即向左侧方清除旧条形
       */

      if(b < bMax && (e == eMax || begin.bars[b] < end.bars[e])) {
        _tweens.add(new BarTween(begin.bars[b], begin.bars[b].collapsed));
        b++;
      } else if (e < eMax && (b == bMax || end.bars[e] < begin.bars[b])) {
        /*
      这里的条件判断中包含两种情况
      e < eMax && b == bMax：
        当新图表条形数增加时
      e < eMax && end.bars[e] < begin.bars[b]：
        当新图表包含旧图表没有的颜色条形时
      满足一种情况，处理旧图表中没有的条形，即向右侧方绘制新条形
       */
        _tweens.add(new BarTween(end.bars[e], end.bars[e].collapsed));
        e++;
      } else {
        _tweens.add(new BarTween(begin.bars[b], end.bars[e]));
        b++;
        e++;
      }
    }
  }
  @override
  BarChart lerp(double t) => new BarChart(
    new List.generate(
      _tweens.length,
      (i) => _tweens[i].lerp(t)
    )
  );
}

class Bar {
  Bar(this.rank,this.x, this.width, this.height, this.color);
  final int rank;
  final double x;
  final double width;
  final double height;
  final Color color;
  Bar get collapsed => new Bar(rank,x, 0.0, 0.0, color);

  bool operator <(Bar other) {
    return rank < other.rank;
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
