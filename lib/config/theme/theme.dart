import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'dimens.dart';
import '../../core/utilities/extension/num_extension.dart';

class AppTheme {
  static final AppTheme instance = AppTheme._init();
  AppTheme._init();

  final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryGreen,
      brightness: Brightness.dark,
      primary: AppColors.lightGreen,
      secondary: AppColors.mintGreen,
      surface: const Color.fromARGB(255, 18, 18, 18),
      error: AppColors.error,
      onPrimary: AppColors.primaryText,
      onSecondary: AppColors.primaryText,
      onSurface: AppColors.white,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 12, 12, 12),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      centerTitle: false,
      elevation: 0,
      titleTextStyle: 16.w600.copyWith(color: AppColors.white),
      iconTheme: const IconThemeData(color: AppColors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: Dimens.mediumSizeText.w400.copyWith(
        color: const Color.fromARGB(255, 120, 120, 120),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: Color.fromARGB(255, 48, 48, 48)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: Color.fromARGB(255, 48, 48, 48)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.lightGreen, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 24, 24, 24),
      iconColor: AppColors.white,
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,
    ),
  );

  final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryGreen,
      primary: AppColors.primaryGreen,
      secondary: AppColors.lightGreen,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.primaryText,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surface,
      centerTitle: false,
      elevation: 0,
      titleTextStyle: 16.w600.copyWith(color: AppColors.primaryText),
      iconTheme: const IconThemeData(color: AppColors.primaryText),
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 2,
      shadowColor: AppColors.lightOverlay,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.sp),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: Dimens.mediumSizeText.w400.copyWith(
        color: AppColors.tertiaryText,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.primaryGreen, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      filled: true,
      fillColor: AppColors.surfaceVariant,
      iconColor: AppColors.primaryText,
      prefixIconColor: AppColors.primaryText,
      suffixIconColor: AppColors.primaryText,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.sp)),
      ),
    ),
  );

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static bool _assetExists(String assetPath) {
    try {
      Image.asset(assetPath);
      return true;
    } catch (e) {
      // If an error occurs, the asset does not exist
      return false;
    }
  }

  static String getAsset(BuildContext context, String assetName) {
    String name = assetName.split('/').last;

    String dark = 'assets/svg/dark/$name';
    String light = 'assets/svg/light/$name';
    assert(_assetExists(dark), '$assetName does not exist');
    assert(_assetExists(light), '$assetName does not exist');
    if (isDarkMode(context)) {
      return dark;
    } else {
      return light;
    }
  }
}
