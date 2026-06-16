import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Color tokens, mirrors the web version's palette.
class AppColors {
  static const ink = Color(0xFF0B0E1A);
  static const maroon = Color(0xFF3D0F1A);
  static const marigold = Color(0xFFE8862A);
  static const gold = Color(0xFFC9A227);
  static const rose = Color(0xFFD9636B);
  static const ivory = Color(0xFFF3ECE0);
}

/// Type tokens. Display = Cormorant Garamond, body/utility = Work Sans.
class AppText {
  static TextStyle display({
    double size = 36,
    FontWeight weight = FontWeight.w600,
    bool italic = false,
    Color color = AppColors.ivory,
  }) {
    return GoogleFonts.cormorantGaramond(
      fontSize: size,
      fontWeight: weight,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      color: color,
      height: 1.05,
    );
  }

  static TextStyle body({
    double size = 16,
    FontWeight weight = FontWeight.w300,
    Color color = const Color(0xE6F3ECE0),
  }) {
    return GoogleFonts.workSans(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: 1.6,
    );
  }

  static TextStyle label({
    double size = 10,
    Color color = const Color(0x80F3ECE0),
  }) {
    return GoogleFonts.workSans(
      fontSize: size,
      letterSpacing: 3.0,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
}

/// Mirrors CSS clamp(): scales with available width between [min] and [max].
double clampSize(double width, {required double min, required double max, double basis = 1000}) {
  final scaled = width / basis * max;
  return scaled.clamp(min, max);
}
