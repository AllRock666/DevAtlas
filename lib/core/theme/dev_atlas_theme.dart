import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DevAtlasTheme {
  static TextTheme _buildTextTheme(TextTheme base) {
    return GoogleFonts.interTextTheme(base).copyWith(
      displayLarge: GoogleFonts.outfit(fontWeight: FontWeight.w700),
      displayMedium: GoogleFonts.outfit(fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.inter(fontSize: 18, height: 1.6), // Reading-first typography
      bodyMedium: GoogleFonts.inter(fontSize: 16, height: 1.5),
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blueGrey,
        brightness: Brightness.dark,
        surface: const Color(0xFF1E1E1E),
      ),
      textTheme: _buildTextTheme(base.textTheme),
      useMaterial3: true,
    );
  }

  static ThemeData get amoledTheme {
    final base = ThemeData.dark();
    return base.copyWith(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.grey,
        brightness: Brightness.dark,
        surface: Colors.black,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      useMaterial3: true,
    );
  }

  static ThemeData get sepiaTheme {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: const Color(0xFFF4ECD8),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF5E4B3C),
        brightness: Brightness.light,
        surface: const Color(0xFFF4ECD8),
      ),
      textTheme: _buildTextTheme(base.textTheme),
      useMaterial3: true,
    );
  }
  
  static ThemeData get focusTheme {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        brightness: Brightness.light,
        surface: Colors.white,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      useMaterial3: true,
    );
  }
}
