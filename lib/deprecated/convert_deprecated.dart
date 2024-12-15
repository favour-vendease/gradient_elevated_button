

import 'package:flutter/material.dart';


extension ColorDeprecatedSolution on Color{
  int get valueDeprecated{
   return _floatToInt8(a) << 24 |
    _floatToInt8(r) << 16 |
    _floatToInt8(g) << 8 |
    _floatToInt8(b) << 0;
  }
  double get opacityDeprecated=> alphaDeprecated / 0xFF;
  int get alphaDeprecated => (0xff000000 & valueDeprecated) >> 24;
  Color withOpacityDeprecated(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }

  static int _floatToInt8(double x) {
    return (x * 255.0).round() & 0xff;
  }
}