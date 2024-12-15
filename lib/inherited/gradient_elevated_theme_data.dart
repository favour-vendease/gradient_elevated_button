import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/button_style.dart';

/// A widget that provides a way to define a global style for [GradientElevatedButton]
/// widgets within the widget tree.
///
/// This widget allows you to specify a [GradientButtonStyle] that can be applied
/// to all [GradientElevatedButton] widgets within its scope.
class GradientButtonThemeData extends InheritedWidget {
  /// The [GradientButtonStyle] data that will be applied to [GradientElevatedButton]s.
  final GradientButtonStyle? data;

  /// Creates a new instance of [GradientButtonThemeData].
  ///
  /// The [data] parameter allows you to pass a [GradientButtonStyle] that will
  /// be used by all [GradientElevatedButton] widgets within this widget's scope.
  /// The [child] parameter is the widget subtree that will inherit this theme.
  const GradientButtonThemeData({super.key, this.data, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    /// Returns `true` to notify dependent widgets that the theme data has changed.
    return true;
  }

  /// A helper method to retrieve the [GradientButtonStyle] from the closest
  /// [GradientButtonThemeData] widget in the widget tree.
  ///
  /// This allows the [GradientElevatedButton] widgets to use the inherited style
  /// defined by [GradientButtonThemeData].
  ///
  /// Returns `null` if no [GradientButtonThemeData] is found in the widget tree.
  static GradientButtonStyle? of(BuildContext context) {
    /// This line is where we access the data from the InheritedWidget.
    return context
        .dependOnInheritedWidgetOfExactType<GradientButtonThemeData>()
        ?.data;
  }
}
