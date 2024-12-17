part of '../gradient_elevated_button.dart';

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

class GradientButtonTheme extends InheritedTheme {
  /// Create a [ElevatedButtonTheme].
  const GradientButtonTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// The configuration of this theme.
  final GradientElevatedButtonThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [ElevatedButtonTheme] widget, then
  /// [ThemeData.elevatedButtonTheme] is used.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ElevatedButtonThemeData theme = ElevatedButtonTheme.of(context);
  /// ```
  static GradientElevatedButtonThemeData? of(BuildContext context) {
    final GradientButtonTheme? buttonTheme =
        context.dependOnInheritedWidgetOfExactType<GradientButtonTheme>();
    return buttonTheme?.data ??
        GradientElevatedButtonThemeData(
            style: GradientButtonStyle.fromElevatedButtonStyle(
                Theme.of(context).elevatedButtonTheme.style));
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return GradientButtonTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ElevatedButtonTheme oldWidget) =>
      data.style != oldWidget.data.style;
}

@immutable
class GradientElevatedButtonThemeData with Diagnosticable {
  /// Creates an [GradientElevatedButtonThemeData].
  ///
  /// The [style] may be null.
  const GradientElevatedButtonThemeData({this.style});

  /// Overrides for [ElevatedButton]'s default style.
  ///
  /// Non-null properties or non-null resolved [WidgetStateProperty]
  /// values override the [ButtonStyle] returned by
  /// [ElevatedButton.defaultStyleOf].
  ///
  /// If [style] is null, then this theme doesn't override anything.
  final GradientButtonStyle? style;

  /// Linearly interpolate between two elevated button themes.
  static GradientElevatedButtonThemeData? lerp(
      GradientElevatedButtonThemeData? a,
      GradientElevatedButtonThemeData? b,
      double t) {
    if (identical(a, b)) {
      return a;
    }
    return GradientElevatedButtonThemeData(
      style: GradientButtonStyle.ler(a?.style, b?.style, t),
    );
  }

  @override
  int get hashCode => style.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ElevatedButtonThemeData && other.style == style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<ButtonStyle>('style', style, defaultValue: null));
  }
}
