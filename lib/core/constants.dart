import 'package:flutter/material.dart';

/// =======================
/// COLORS
/// =======================
class AppColors {
  // Brand colors
  static const Color primary = Color(0xFF5B5FFF);     // Vibrant Blue
  static const Color secondary = Color(0xFFFFC107);   // Amber

  // Backgrounds
  static const Color background = Color(0xFFF6F7FB);
  static const Color surface = Colors.white;

  // Text
  static const Color textPrimary = Color(0xFF1F1F1F);
  static const Color textSecondary = Color(0xFF6B7280);

  // Status
  static const Color error = Color(0xFFD32F2F);
}

/// =======================
/// GRADIENTS
/// =======================
class AppGradients {
  static const LinearGradient study = LinearGradient(
    colors: [Color(0xFF5B5FFF), Color(0xFF8F94FB)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient fitness = LinearGradient(
    colors: [Color(0xFFFF8A00), Color(0xFFFFC107)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient profile = LinearGradient(
    colors: [Color(0xFF00BFA6), Color(0xFF1DE9B6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

/// =======================
/// SPACING
/// =======================
class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

/// =======================
/// RADIUS
/// =======================
class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 20;
}

/// =======================
/// TEXT SIZES
/// =======================
class AppTextSize {
  static const double heading = 24;
  static const double title = 18;
  static const double subtitle = 16;
  static const double body = 14;
}
