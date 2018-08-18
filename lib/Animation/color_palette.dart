import 'package:flutter/material.dart';
import 'dart:math';

class ColorPalette {
  static final ColorPalette primary = new ColorPalette(<Color>[
    Colors.blue[400],
    Colors.red[400],
    Colors.green[400],
    Colors.yellow[400],
    Colors.purple[400],
    Colors.orange[400],
    Colors.teal[400],
  ]);

  ColorPalette(List<Color> colors) : _colors = colors {
    assert(colors.isNotEmpty);
  }

  final List<Color> _colors;

  Color operator [](int index) {
    return _colors[index % length];
  }

  int get length {
    return _colors.length;
  }

  Color random(Random random) {
    return this[random.nextInt(length)];
  }
}

