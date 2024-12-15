library gradient_elevated_button;

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradient_elevated_button/deprecated/convert_deprecated.dart';
import 'button_style.dart';
import 'button_style_button.dart' as style;

class GradientElevatedButton extends style.ButtonStyleButton {
  /// Create an GradientElevatedButton.
  const GradientElevatedButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
  });

  /// Create an gradient elevated button from a pair of widgets that serve as the button's
  /// [icon] and [label].
  ///
  /// The icon and label are arranged in a row and padded by 12 logical pixels
  /// at the start, and 16 at the end, with an 8 pixel gap in between.
  factory GradientElevatedButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    GradientButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    WidgetStatesController? statesController,
    required Widget icon,
    required Widget label,
  }) = _ElevatedButtonWithIcon;

  /// A static convenience method that constructs a [GradientButtonStyle]
  /// for the [GradientElevatedButton] using simple values.
  ///
  /// This method allows you to customize the appearance of a gradient button,
  /// including foreground and background colors, elevation, cursor style, and
  /// the button's response to user interactions such as hover, focus, and press.
  ///
  /// The [foregroundColor] and [disabledForegroundColor] are used to create
  /// [WidgetStateProperty] for the button's text and icon color, and
  /// [GradientButtonStyle.overlayColor] is derived from these values.
  ///
  /// The [backgroundColor] and [disabledBackgroundColor] are used to set
  /// [WidgetStateProperty] for the button's background color.
  ///
  /// Elevation is managed using the [elevation] parameter. When the button is
  /// disabled, it has the same elevation as specified by [elevation]. The
  /// button's elevation increases to [elevation + 2] when hovered or focused,
  /// and it becomes [elevation + 6] when pressed.
  ///
  /// Additionally, the [enabledMouseCursor] and [disabledMouseCursor] parameters
  /// are used to define the [GradientButtonStyle.mouseCursor] for different states.
  ///
  /// All other parameters are either directly used or applied to create a
  /// [WidgetStateProperty] with a single value for all states.
  ///
  /// By default, this method returns a [GradientButtonStyle] that doesn't
  /// override anything, but you can customize various aspects as needed.
  ///
  /// For instance, to change the button's foreground color and overlay color,
  /// you can use the following code:
  ///
  /// ```dart
  /// GradientElevatedButton(
  ///   style: GradientElevatedButton.styleFrom(foregroundColor: Colors.green),
  ///   onPressed: () {
  ///     // ...
  ///   },
  ///   child: const Text('Jump'),
  /// ),
  /// ```
  ///
  /// Similarly, to change the background color:
  ///
  /// ```dart
  /// GradientElevatedButton(
  ///   style: GradientElevatedButton.styleFrom(backgroundColor: Colors.green),
  ///   onPressed: () {
  ///     // ...
  ///   },
  ///   child: const Text('Meow'),
  /// ),
  /// ```

  static GradientButtonStyle styleFrom({
    Gradient? gradient,
    Color? foregroundColor,
    Color? disabledForegroundColor,
    Color? disabledBackgroundColor,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
    MouseCursor? enabledMouseCursor,
    MouseCursor? disabledMouseCursor,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
    @Deprecated('Use backgroundColor instead. '
        'This feature was deprecated after v3.1.0.')
    Color? primary,
    @Deprecated('Use foregroundColor instead. '
        'This feature was deprecated after v3.1.0.')
    Color? onPrimary,
    @Deprecated(
        'Use disabledForegroundColor and disabledBackgroundColor instead. '
        'This feature was deprecated after v3.1.0.')
    Color? onSurface,
  }) {
    final Color? foreground = foregroundColor ?? onPrimary;
    final Color? disabledForeground =
        disabledForegroundColor ?? onSurface?.withOpacityDeprecated(0.38);
    final WidgetStateProperty<Color?>? foregroundColorProp =
        (foreground == null && disabledForeground == null)
            ? null
            : _ElevatedButtonDefaultColor(foreground, disabledForeground);
    final WidgetStateProperty<Color?>? overlayColor =
        (foreground == null) ? null : _ElevatedButtonDefaultOverlay(foreground);
    final WidgetStateProperty<double>? elevationValue =
        (elevation == null) ? null : _ElevatedButtonDefaultElevation(elevation);
    final WidgetStateProperty<MouseCursor?>? mouseCursor =
        (enabledMouseCursor == null && disabledMouseCursor == null)
            ? null
            : _ElevatedButtonDefaultMouseCursor(
                enabledMouseCursor, disabledMouseCursor);

    return GradientButtonStyle(
      gradient: gradient,
      textStyle: WidgetStatePropertyAll<TextStyle?>(textStyle),
      foregroundColor: foregroundColorProp,
      overlayColor: overlayColor,
      shadowColor: ButtonStyleButton.allOrNull<Color>(shadowColor),
      surfaceTintColor: ButtonStyleButton.allOrNull<Color>(surfaceTintColor),
      elevation: elevationValue,
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      minimumSize: ButtonStyleButton.allOrNull<Size>(minimumSize),
      fixedSize: ButtonStyleButton.allOrNull<Size>(fixedSize),
      maximumSize: ButtonStyleButton.allOrNull<Size>(maximumSize),
      side: ButtonStyleButton.allOrNull<BorderSide>(side),
      shape: ButtonStyleButton.allOrNull<OutlinedBorder>(shape),
      mouseCursor: mouseCursor,
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
    );
  }

  /// Defines the default appearance of the [GradientElevatedButton].
  ///
  /// The button's [child] widgets such as [Text] and [Icon] are rendered with
  /// the [GradientButtonStyle]'s foreground color. The button's [InkWell] adds
  /// the style's overlay color when the button is focused, hovered,
  /// or pressed. The button's background color becomes its [Material]
  /// color as defined in the style.
  ///
  /// The default values for the [GradientButtonStyle] properties are as follows.
  /// "Theme.foo" is shorthand for `Theme.of(context).foo`, and color scheme
  /// values like "onSurface(0.38)" are shorthand for `onSurface.withOpacity(0.38)`.
  /// Properties that are not followed by a sublist have the same value for all states,
  /// otherwise, the values are as specified for each state, and "others" refers to
  /// all other states.
  ///
  /// The `textScaleFactor` refers to the value of `MediaQuery.of(context).textScaleFactor`.
  /// The names of the `EdgeInsets` constructors and `EdgeInsetsGeometry.lerp` are
  /// abbreviated for readability.
  ///
  /// The color of the [ButtonStyle.textStyle] is not used; instead, the
  /// [ButtonStyle.foregroundColor] color is used.
  ///
  /// ## Material 2 Defaults
  ///
  /// * `textStyle` - Theme.textTheme.button
  /// * `backgroundColor`
  ///   * disabled - Theme.colorScheme.onSurface(0.12)
  ///   * others - Theme.colorScheme.primary
  /// * `foregroundColor`
  ///   * disabled - Theme.colorScheme.onSurface(0.38)
  ///   * others - Theme.colorScheme.onPrimary
  /// * `overlayColor`
  ///   * hovered - Theme.colorScheme.onPrimary(0.08)
  ///   * focused or pressed - Theme.colorScheme.onPrimary(0.24)
  /// * `shadowColor` - Theme.shadowColor
  /// * `elevation`
  ///   * disabled - 0
  ///   * default - 2
  ///   * hovered or focused - 4
  ///   * pressed - 8
  /// * `padding`
  ///   * `textScaleFactor <= 1` - horizontal(16)
  ///   * `1 < textScaleFactor <= 2` - lerp(horizontal(16), horizontal(8))
  ///   * `2 < textScaleFactor <= 3` - lerp(horizontal(8), horizontal(4))
  ///   * `3 < textScaleFactor` - horizontal(4)
  /// * `minimumSize` - Size(64, 36)
  /// * `fixedSize` - null
  /// * `maximumSize` - Size.infinite
  /// * `side` - null
  /// * `shape` - RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
  /// * `mouseCursor`
  ///   * disabled - SystemMouseCursors.basic
  ///   * others - SystemMouseCursors.click
  /// * `visualDensity` - theme.visualDensity
  /// * `tapTargetSize` - theme.materialTapTargetSize
  /// * `animationDuration` - kThemeChangeDuration
  /// * `enableFeedback` - true
  /// * `alignment` - Alignment.center
  /// * `splashFactory` - InkRipple.splashFactory
  ///
  /// The default padding values for the [GradientElevatedButton.icon] factory are slightly different:
  ///
  /// * `padding`
  ///   * `textScaleFactor <= 1` - start(12) end(16)
  ///   * `1 < textScaleFactor <= 2` - lerp(start(12) end(16), horizontal(8))
  ///   * `2 < textScaleFactor <= 3` - lerp(horizontal(8), horizontal(4))
  ///   * `3 < textScaleFactor` - horizontal(4)
  ///
  /// The default value for `side`, which defines the appearance of the button's
  /// outline, is null. This means that the outline is defined by the button
  /// shape's [OutlinedBorder.side]. Typically, the default value of an
  /// [OutlinedBorder]'s side is [BorderSide.none], so an outline is not drawn.
  ///
  /// ## Material 3 Defaults
  ///
  /// If [ThemeData.useMaterial3] is set to true, the following defaults will
  /// be used:
  ///
  /// * `textStyle` - Theme.textTheme.labelLarge
  /// * `backgroundColor`
  ///   * disabled - Theme.colorScheme.onSurface(0.12)
  ///   * others - Theme.colorScheme.surface
  /// * `foregroundColor`
  ///   * disabled - Theme.colorScheme.onSurface(0.38)
  ///   * others - Theme.colorScheme.primary
  /// * `overlayColor`
  ///   * hovered - Theme.colorScheme.primary(0.08)
  ///   * focused or pressed - Theme.colorScheme.primary(0.12)
  /// * `shadowColor` - Theme.colorScheme.shadow
  /// * `surfaceTintColor` - Theme.colorScheme.surfaceTint
  /// * `elevation`
  ///   * disabled - 0
  ///   * default - 1
  ///   * hovered - 3
  ///   * focused or pressed - 1
  /// * `padding`
  ///   * `textScaleFactor <= 1` - horizontal(16)
  ///   * `1 < textScaleFactor <= 2` - lerp(horizontal(16), horizontal(8))
  ///   * `2 < textScaleFactor <= 3` - lerp(horizontal(8), horizontal(4))
  ///   * `3 < textScaleFactor` - horizontal(4)
  /// * `minimumSize` - Size(64, 40)
  /// * `fixedSize` - null
  /// * `maximumSize` - Size.infinite
  /// * `side` - null
  /// * `shape` - StadiumBorder()
  /// * `mouseCursor`
  ///   * disabled - SystemMouseCursors.basic
  ///   * others - SystemMouseCursors.click
  /// * `visualDensity` - Theme.visualDensity
  /// * `tapTargetSize` - Theme.materialTapTargetSize
  /// * `animationDuration` - kThemeChangeDuration
  /// * `enableFeedback` - true
  /// * `alignment` - Alignment.center
  /// * `splashFactory` - Theme.splashFactory

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Theme.of(context).useMaterial3
        ? _ElevatedButtonDefaultsM3(context)
        : styleFrom(
            foregroundColor: colorScheme.onPrimary,
            disabledBackgroundColor: colorScheme.onSurface.withOpacityDeprecated(0.12),
            disabledForegroundColor: colorScheme.onSurface.withOpacityDeprecated(0.38),
            shadowColor: theme.shadowColor,
            elevation: 2,
            textStyle: theme.textTheme.labelLarge,
            padding: _scaledPadding(context),
            minimumSize: const Size(64, 36),
            maximumSize: Size.infinite,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            enabledMouseCursor: SystemMouseCursors.click,
            disabledMouseCursor: SystemMouseCursors.basic,
            visualDensity: theme.visualDensity,
            tapTargetSize: theme.materialTapTargetSize,
            animationDuration: kThemeChangeDuration,
            enableFeedback: true,
            alignment: Alignment.center,
            splashFactory: InkRipple.splashFactory,
          );
  }

  /// Returns the [ElevatedButtonThemeData.style] of the closest
  /// [ElevatedButtonTheme] ancestor.
  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButtonTheme.of(context).style;
  }
}

EdgeInsetsGeometry _scaledPadding(BuildContext context) {
  return ButtonStyleButton.scaledPadding(
    const EdgeInsets.symmetric(horizontal: 16),
    const EdgeInsets.symmetric(horizontal: 8),
    const EdgeInsets.symmetric(horizontal: 4),
    1,
  );
}

@immutable
class _ElevatedButtonDefaultColor extends WidgetStateProperty<Color?>
    with Diagnosticable {
  _ElevatedButtonDefaultColor(this.color, this.disabled);

  final Color? color;
  final Color? disabled;

  @override
  Color? resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return disabled;
    }
    return color;
  }
}

@immutable
class _ElevatedButtonDefaultOverlay extends WidgetStateProperty<Color?>
    with Diagnosticable {
  _ElevatedButtonDefaultOverlay(this.overlay);

  final Color overlay;

  @override
  Color? resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.hovered)) {
      return overlay.withOpacityDeprecated(0.08);
    }
    if (states.contains(WidgetState.focused) ||
        states.contains(WidgetState.pressed)) {
      return overlay.withOpacityDeprecated(0.24);
    }
    return null;
  }
}

@immutable
class _ElevatedButtonDefaultElevation extends WidgetStateProperty<double>
    with Diagnosticable {
  _ElevatedButtonDefaultElevation(this.elevation);

  final double elevation;

  @override
  double resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return 0;
    }
    if (states.contains(WidgetState.hovered)) {
      return elevation + 2;
    }
    if (states.contains(WidgetState.focused)) {
      return elevation + 2;
    }
    if (states.contains(WidgetState.pressed)) {
      return elevation + 6;
    }
    return elevation;
  }
}

@immutable
class _ElevatedButtonDefaultMouseCursor
    extends WidgetStateProperty<MouseCursor?> with Diagnosticable {
  _ElevatedButtonDefaultMouseCursor(this.enabledCursor, this.disabledCursor);

  final MouseCursor? enabledCursor;
  final MouseCursor? disabledCursor;

  @override
  MouseCursor? resolve(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return disabledCursor;
    }
    return enabledCursor;
  }
}

class _ElevatedButtonWithIcon extends GradientElevatedButton {
  _ElevatedButtonWithIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    super.statesController,
    required Widget icon,
    required Widget label,
  }) : super(
          autofocus: autofocus ?? false,
          clipBehavior: clipBehavior ?? Clip.none,
          child: _ElevatedButtonWithIconChild(icon: icon, label: label),
        );

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      const EdgeInsetsDirectional.fromSTEB(12, 0, 16, 0),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsetsDirectional.fromSTEB(8, 0, 4, 0),
      1,
    );
    return super.defaultStyleOf(context).copyWith(
          padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(scaledPadding),
        );
  }
}

class _ElevatedButtonWithIconChild extends StatelessWidget {
  const _ElevatedButtonWithIconChild({required this.label, required this.icon});

  final Widget label;
  final Widget icon;

  get math => null;

  @override
  Widget build(BuildContext context) {
    const double scale = 1;
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon, SizedBox(width: gap), Flexible(child: label)],
    );
  }
}


class _ElevatedButtonDefaultsM3 extends ButtonStyle {
  _ElevatedButtonDefaultsM3(this.context)
      : super(
          animationDuration: kThemeChangeDuration,
          enableFeedback: true,
          alignment: Alignment.center,
        );

  final BuildContext context;
  late final ColorScheme _colors = Theme.of(context).colorScheme;

  @override
  WidgetStateProperty<TextStyle?> get textStyle =>
      WidgetStatePropertyAll<TextStyle?>(
          Theme.of(context).textTheme.labelLarge);

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return _colors.onSurface.withOpacityDeprecated(0.12);
        }
        return _colors.surface;
      });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return _colors.onSurface.withOpacityDeprecated(0.38);
        }
        return _colors.primary;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return _colors.primary.withOpacityDeprecated(0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return _colors.primary.withOpacityDeprecated(0.12);
        }
        if (states.contains(WidgetState.pressed)) {
          return _colors.primary.withOpacityDeprecated(0.12);
        }
        return null;
      });

  @override
  WidgetStateProperty<Color>? get shadowColor =>
      WidgetStatePropertyAll<Color>(_colors.shadow);

  @override
  WidgetStateProperty<Color>? get surfaceTintColor =>
      WidgetStatePropertyAll<Color>(_colors.surfaceTint);

  @override
  WidgetStateProperty<double>? get elevation =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return 0.0;
        }
        if (states.contains(WidgetState.hovered)) {
          return 3.0;
        }
        if (states.contains(WidgetState.focused)) {
          return 1.0;
        }
        if (states.contains(WidgetState.pressed)) {
          return 1.0;
        }
        return 1.0;
      });

  @override
  WidgetStateProperty<EdgeInsetsGeometry>? get padding =>
      WidgetStatePropertyAll<EdgeInsetsGeometry>(_scaledPadding(context));

  @override
  WidgetStateProperty<Size>? get minimumSize =>
      const WidgetStatePropertyAll<Size>(Size(64.0, 40.0));

  // No default fixedSize

  @override
  WidgetStateProperty<Size>? get maximumSize =>
      const WidgetStatePropertyAll<Size>(Size.infinite);

  // No default side

  @override
  WidgetStateProperty<OutlinedBorder>? get shape =>
      const WidgetStatePropertyAll<OutlinedBorder>(StadiumBorder());

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      });

  @override
  VisualDensity? get visualDensity => Theme.of(context).visualDensity;

  @override
  MaterialTapTargetSize? get tapTargetSize =>
      Theme.of(context).materialTapTargetSize;

  @override
  InteractiveInkFeatureFactory? get splashFactory =>
      Theme.of(context).splashFactory;
}
