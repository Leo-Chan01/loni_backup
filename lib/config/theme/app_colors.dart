import 'package:flutter/material.dart';

/// Centralized color system for Loni Mobile app
/// All colors should be accessed through this class to ensure consistency
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // ===== PRIMARY BRAND COLORS =====
  /// Main brand accent - Terracotta orange used for primary actions and highlights
  static const Color brandAccent = Color(0xFFB85C38);
  static const Color brandTerracotta = Color(0xFFC46A3A);
  static const Color brandRust = Color(0xFF9E4A2F);

  // ===== DARK MODE COLORS =====
  /// Dark theme backgrounds and surfaces
  static const Color darkBg = Color(0xFF0B0B0C);
  static const Color darkSurface = Color(0xFF161618);
  static const Color darkBorder = Color(0xFF2A2A2E);
  static const Color darkText = Color(0xFFF4F4F5);
  static const Color darkTextMuted = Color(0xFFA1A1AA);

  // ===== LIGHT MODE COLORS =====
  /// Light theme backgrounds and surfaces
  static const Color lightBg = Color(0xFFF9F6F3);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE5E5EA);
  static const Color lightText = Color(0xFF1C1C1E);
  static const Color lightTextMuted = Color(0xFF6E6E73);

  // ===== COMMON COLORS =====
  /// Pure black and white
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // ===== STATUS COLORS =====
  /// Success states
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color successDark = Color(0xFF059669);

  /// Warning states
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color warningDark = Color(0xFFD97706);

  /// Error states
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color errorDark = Color(0xFFDC2626);

  /// Info states
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFDBEAFE);
  static const Color infoDark = Color(0xFF2563EB);

  // ===== SURFACE COLORS (Contextual) =====
  /// Card and container backgrounds
  static const Color surface = lightSurface;
  static const Color surfaceVariant = lightBg;
  
  /// Background colors
  static const Color background = lightBg;

  // ===== OVERLAY COLORS =====
  /// Semi-transparent overlays
  static const Color overlay = Color(0x80000000);
  static const Color lightOverlay = Color(0x40000000);
  static const Color darkOverlay = Color(0xB4000000);

  // ===== GRADIENT COMBINATIONS =====
  /// Brand gradients
  static const List<Color> brandGradient = [brandAccent, brandTerracotta];
  static const List<Color> brandGradientReverse = [brandTerracotta, brandAccent];

  // ===== HELPER METHODS =====
  /// Get color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }

  /// Get status color based on string status
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
      case 'waiting':
        return warning;
      case 'processing':
      case 'in_progress':
        return info;
      case 'completed':
      case 'delivered':
      case 'success':
        return success;
      case 'cancelled':
      case 'rejected':
      case 'failed':
        return error;
      default:
        return info;
    }
  }

  /// Get status light color based on string status
  static Color getStatusLightColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
      case 'waiting':
        return warningLight;
      case 'processing':
      case 'in_progress':
        return infoLight;
      case 'completed':
      case 'delivered':
      case 'success':
        return successLight;
      case 'cancelled':
      case 'rejected':
      case 'failed':
        return errorLight;
      default:
        return infoLight;
    }
  }

  /// Get contrasting text color for given background
  static Color getContrastingTextColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? lightText : white;
  }
}
