import 'package:flutter/material.dart';

class GradientButtonStyle extends ButtonStyle {
  final Gradient? gradient;
  const GradientButtonStyle(
      {this.gradient,
      super.alignment,
      super.animationDuration,
      super.elevation,
      super.enableFeedback,
      super.fixedSize,
      super.foregroundColor,
      super.iconColor,
      super.iconSize,
      super.maximumSize,
      super.minimumSize,
      super.mouseCursor,
      super.overlayColor,
      super.padding,
      super.shadowColor,
      super.shape,
      super.side,
      super.splashFactory,
      super.surfaceTintColor,
      super.tapTargetSize,
      super.textStyle,
      super.visualDensity});

  factory GradientButtonStyle.copyWith(
      {Gradient? gradient, ButtonStyle? style}) {
    return GradientButtonStyle(
      gradient: gradient,
      padding: style?.padding,
      overlayColor: style?.overlayColor,
      mouseCursor: style?.mouseCursor,
      minimumSize: style?.minimumSize,
      maximumSize: style?.maximumSize,
      iconSize: style?.iconSize,
      iconColor: style?.iconColor,
      foregroundColor: style?.foregroundColor,
      fixedSize: style?.fixedSize,
      enableFeedback: style?.enableFeedback,
      elevation: style?.elevation,
      animationDuration: style?.animationDuration,
      alignment: style?.alignment,
      shadowColor: style?.shadowColor,
      shape: style?.shape,
      side: style?.side,
      splashFactory: style?.splashFactory,
      surfaceTintColor: style?.surfaceTintColor,
      tapTargetSize: style?.tapTargetSize,
      textStyle: style?.textStyle,
      visualDensity: style?.visualDensity,
    );
  }
}
