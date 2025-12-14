import 'package:flutter/material.dart';

/// Centralized color system for Loni Africa app
/// All colors should be accessed through this class to ensure consistency
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // ===== PRIMARY BRAND COLORS =====
  /// Main brand green - used for primary actions, highlights, and brand elements
  static const Color primaryGreen = Color.fromARGB(255, 4, 165, 111);

  /// Lighter green shades for backgrounds and subtle highlights
  static const Color lightGreen = Color.fromARGB(255, 76, 175, 80);
  static const Color paleGreen = Color.fromARGB(255, 232, 245, 233);
  static const Color mintGreen = Color.fromARGB(255, 200, 230, 201);

  /// Darker green shades for text and emphasis
  static const Color darkGreen = Color.fromARGB(255, 2, 125, 85);
  static const Color forestGreen = Color.fromARGB(255, 1, 95, 65);

  // ===== SECONDARY BRAND COLORS =====
  /// Clean white for backgrounds and cards
  static const Color white = Color.fromARGB(255, 255, 255, 255);

  /// Soft off-white for subtle backgrounds
  static const Color offWhite = Color.fromARGB(255, 250, 250, 250);

  /// Light grey for borders and dividers
  static const Color lightGrey = Color.fromARGB(255, 245, 245, 245);

  // ===== NEUTRAL COLORS =====
  /// Text colors in order of hierarchy
  static const Color primaryText = Color.fromARGB(255, 33, 33, 33);
  static const Color secondaryText = Color.fromARGB(255, 97, 97, 97);
  static const Color tertiaryText = Color.fromARGB(255, 158, 158, 158);

  /// Border and divider colors
  static const Color border = Color.fromARGB(255, 224, 224, 224);
  static const Color divider = Color.fromARGB(255, 238, 238, 238);

  // ===== STATUS COLORS =====
  /// Success states - use green variants
  static const Color success = primaryGreen;
  static const Color successLight = Color.fromARGB(255, 232, 245, 233);
  static const Color successDark = darkGreen;

  /// Warning states - warm orange tones that complement green
  static const Color warning = Color.fromARGB(255, 255, 152, 0);
  static const Color warningLight = Color.fromARGB(255, 255, 243, 224);
  static const Color warningDark = Color.fromARGB(255, 230, 119, 0);

  /// Error states - muted red that works with green
  static const Color error = Color.fromARGB(255, 211, 47, 47);
  static const Color errorLight = Color.fromARGB(255, 255, 235, 238);
  static const Color errorDark = Color.fromARGB(255, 183, 28, 28);

  /// Info states - subtle blue-grey that complements green
  static const Color info = Color.fromARGB(255, 2, 136, 209);
  static const Color infoLight = Color.fromARGB(255, 227, 242, 253);
  static const Color infoGrey = Colors.blueGrey;
  static const Color infoDark = Color.fromARGB(255, 1, 87, 155);

  // ===== ORDER STATUS COLORS =====
  /// Pending orders - soft amber
  static const Color pending = Color.fromARGB(255, 255, 193, 7);
  static const Color pendingLight = Color.fromARGB(255, 255, 248, 225);
  static const Color pendingDark = Color.fromARGB(255, 255, 160, 0);

  /// Processing orders - use primary green variants
  static const Color processing = primaryGreen;
  static const Color processingLight = successLight;
  static const Color processingDark = successDark;

  /// Completed orders - deeper green
  static const Color completed = forestGreen;
  static const Color completedLight = Color.fromARGB(255, 200, 230, 201);
  static const Color completedDark = Color.fromARGB(255, 27, 94, 32);

  /// Cancelled/Rejected orders - use error colors
  static const Color cancelled = error;
  static const Color cancelledLight = errorLight;
  static const Color cancelledDark = errorDark;

  // ===== SURFACE COLORS =====
  /// Card and container backgrounds
  static const Color surface = white;
  static const Color surfaceVariant = offWhite;
  static const Color surfaceContainer = lightGrey;

  /// Elevated surfaces (modals, bottom sheets)
  static const Color surfaceElevated = white;

  /// Background colors
  static const Color background = offWhite;
  static const Color backgroundVariant = lightGrey;

  // ===== OVERLAY COLORS =====
  /// Semi-transparent overlays
  static const Color overlay = Color.fromARGB(128, 0, 0, 0);
  static const Color lightOverlay = Color.fromARGB(64, 0, 0, 0);
  static const Color darkOverlay = Color.fromARGB(180, 0, 0, 0);

  // ===== GRADIENT COMBINATIONS =====
  /// Primary green gradients
  static const List<Color> primaryGradient = [primaryGreen, lightGreen];
  static const List<Color> primaryGradientReverse = [lightGreen, primaryGreen];

  /// Success gradients
  static const List<Color> successGradient = [success, lightGreen];

  /// Subtle background gradients
  static const List<Color> backgroundGradient = [white, offWhite];
  static const List<Color> cardGradient = [white, lightGrey];

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
        return pending;
      case 'processing':
      case 'in_progress':
        return processing;
      case 'completed':
      case 'delivered':
      case 'success':
        return completed;
      case 'cancelled':
      case 'rejected':
      case 'failed':
        return cancelled;
      default:
        return info;
    }
  }

  /// Get status light color based on string status
  static Color getStatusLightColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
      case 'waiting':
        return pendingLight;
      case 'processing':
      case 'in_progress':
        return processingLight;
      case 'completed':
      case 'delivered':
      case 'success':
        return completedLight;
      case 'cancelled':
      case 'rejected':
      case 'failed':
        return cancelledLight;
      default:
        return infoLight;
    }
  }

  /// Get contrasting text color for given background
  static Color getContrastingTextColor(Color backgroundColor) {
    // Calculate luminance to determine if text should be light or dark
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? primaryText : white;
  }
}
