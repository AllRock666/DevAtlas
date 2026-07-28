import 'package:flutter/material.dart';

enum ThemePreference { dark, amoled, sepia, focus }

extension ReaderThemeColors on ThemePreference {
  Color get backgroundColor {
    switch (this) {
      case ThemePreference.dark: return const Color(0xFF1E1E1E);
      case ThemePreference.amoled: return Colors.black;
      case ThemePreference.sepia: return const Color(0xFFF4ECD8);
      case ThemePreference.focus: return const Color(0xFF2C2C2C);
    }
  }

  Color get textColor {
    switch (this) {
      case ThemePreference.dark: return const Color(0xFFE5E7EB);
      case ThemePreference.amoled: return const Color(0xFFD1D5DB);
      case ThemePreference.sepia: return const Color(0xFF433422);
      case ThemePreference.focus: return const Color(0xFF9CA3AF);
    }
  }
  
  Color get surfaceColor {
    switch (this) {
      case ThemePreference.dark: return const Color(0xFF2D2D2D);
      case ThemePreference.amoled: return const Color(0xFF121212);
      case ThemePreference.sepia: return const Color(0xFFEAE0C8);
      case ThemePreference.focus: return const Color(0xFF333333);
    }
  }
}

class ReaderPreferences {
  final ThemePreference theme;
  final double fontSize;
  final double lineHeight;
  final double readingWidth;
  final double codeFontSize;
  final double paragraphSpacing;
  final double headingScale;
  final String fontFamily;

  const ReaderPreferences({
    this.theme = ThemePreference.dark,
    this.fontSize = 18.0,
    this.lineHeight = 1.6,
    this.readingWidth = 800.0,
    this.codeFontSize = 14.0,
    this.paragraphSpacing = 16.0,
    this.headingScale = 1.2,
    this.fontFamily = 'Inter',
  });

  ReaderPreferences copyWith({
    ThemePreference? theme,
    double? fontSize,
    double? lineHeight,
    double? readingWidth,
    double? codeFontSize,
    double? paragraphSpacing,
    double? headingScale,
    String? fontFamily,
  }) {
    return ReaderPreferences(
      theme: theme ?? this.theme,
      fontSize: fontSize ?? this.fontSize,
      lineHeight: lineHeight ?? this.lineHeight,
      readingWidth: readingWidth ?? this.readingWidth,
      codeFontSize: codeFontSize ?? this.codeFontSize,
      paragraphSpacing: paragraphSpacing ?? this.paragraphSpacing,
      headingScale: headingScale ?? this.headingScale,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}
