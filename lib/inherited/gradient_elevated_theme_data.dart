import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/button_style.dart';

class GradientButtonThemeData extends InheritedWidget {
  final GradientButtonStyle? data;
  const GradientButtonThemeData({super.key, this.data, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static GradientButtonStyle? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GradientButtonThemeData>()
        ?.data;
  }
}
