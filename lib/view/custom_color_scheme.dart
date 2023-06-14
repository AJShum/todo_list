// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  const CustomColorScheme({
    required this.suport_separator,
    required this.suport_overlay,
    required this.label_primary,
    required this.label_secondary,
    required this.label_tertiary,
    required this.label_disable,
    required this.red,
    required this.green,
    required this.blue,
    required this.gray,
    required this.gray_light,
    required this.white,
    required this.back_primary,
    required this.back_secondary,
    required this.back_elevated,
  });

  final Color? suport_separator;
  final Color? suport_overlay;
  final Color? label_primary;
  final Color? label_secondary;
  final Color? label_tertiary;
  final Color? label_disable;
  final Color? red;
  final Color? green;
  final Color? blue;
  final Color? gray;
  final Color? gray_light;
  final Color? white;
  final Color? back_primary;
  final Color? back_secondary;
  final Color? back_elevated;

  @override
  ThemeExtension<CustomColorScheme> copyWith({
    Color? suport_separator,
    Color? suport_overlay,
    Color? label_primary,
    Color? label_secondary,
    Color? label_tertiary,
    Color? label_disable,
    Color? red,
    Color? green,
    Color? blue,
    Color? gray,
    Color? gray_light,
    Color? white,
    Color? back_primary,
    Color? back_secondary,
    Color? back_elevated,
  }) {
    return CustomColorScheme(
      suport_separator: suport_separator ?? this.suport_separator,
      suport_overlay: suport_overlay ?? this.suport_overlay,
      label_primary: label_primary ?? this.label_primary,
      label_secondary: label_secondary ?? this.label_secondary,
      label_tertiary: label_tertiary ?? this.label_tertiary,
      label_disable: label_disable ?? this.label_disable,
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      gray: gray ?? this.gray,
      gray_light: gray_light ?? this.gray_light,
      white: white ?? this.white,
      back_primary: back_primary ?? this.back_primary,
      back_secondary: back_secondary ?? this.back_secondary,
      back_elevated: back_elevated ?? this.back_elevated,
    );
  }

  @override
  ThemeExtension<CustomColorScheme> lerp(
      ThemeExtension<CustomColorScheme>? other, double t) {
    if (other is! CustomColorScheme) {
      return this;
    }
    return CustomColorScheme(
      suport_separator: Color.lerp(suport_separator, other.suport_separator, t),
      suport_overlay: Color.lerp(suport_overlay, other.suport_overlay, t),
      label_primary: Color.lerp(label_primary, other.label_primary, t),
      label_secondary: Color.lerp(label_secondary, other.label_secondary, t),
      label_tertiary: Color.lerp(label_tertiary, other.label_tertiary, t),
      label_disable: Color.lerp(label_disable, other.label_disable, t),
      red: Color.lerp(red, other.red, t),
      green: Color.lerp(green, other.green, t),
      blue: Color.lerp(blue, other.blue, t),
      gray: Color.lerp(gray, other.gray, t),
      gray_light: Color.lerp(gray_light, other.gray_light, t),
      white: Color.lerp(white, other.white, t),
      back_primary: Color.lerp(back_primary, other.back_primary, t),
      back_secondary: Color.lerp(back_secondary, other.back_secondary, t),
      back_elevated: Color.lerp(back_elevated, other.back_elevated, t),
    );
  }

  static const light = CustomColorScheme(
    suport_separator: Color(0x33000000),
    suport_overlay: Color(0x0F000000),
    label_primary: Color(0xFF000000),
    label_secondary: Color(0x99000000),
    label_tertiary: Color(0x4D000000),
    label_disable: Color(0x26000000),
    red: Color(0xFFFF3B30),
    green: Color(0xFF34C759),
    blue: Color(0xFF007AFF),
    gray: Color(0xFF8E8E93),
    gray_light: Color(0xFFD1D1D6),
    white: Color(0xFFFFFFFF),
    back_primary: Color(0xFFF7F6F2),
    back_secondary: Color(0xFFFFFFFF),
    back_elevated: Color(0xFFFFFFFF),
  );

  static const dark = CustomColorScheme(
    suport_separator: Color(0x33ffffff),
    suport_overlay: Color(0x52000000),
    label_primary: Color(0xFFFFFFFF),
    label_secondary: Color(0x99FFFFFF),
    label_tertiary: Color(0x66FFFFFF),
    label_disable: Color(0x26FFFFFF),
    red: Color(0xFFFF453A),
    green: Color(0xFF32D748),
    blue: Color(0xFF0A84FF),
    gray: Color(0xFF8E8E93),
    gray_light: Color(0xFF48484A),
    white: Color(0xFFFFFFFF),
    back_primary: Color(0xFF161618),
    back_secondary: Color(0xFF252528),
    back_elevated: Color(0xFF3C3C3F),
  );
}
