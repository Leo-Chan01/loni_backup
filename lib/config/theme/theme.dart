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
    fontFamily: 'Inter',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.brandAccent,
      brightness: Brightness.dark,
      primary: AppColors.brandAccent,
      secondary: AppColors.brandTerracotta,
      surface: AppColors.darkSurface,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.darkText,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.darkBg,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBg,
      centerTitle: false,
      elevation: 0,
      titleTextStyle: 16.w600.copyWith(color: AppColors.darkText),
      iconTheme: const IconThemeData(color: AppColors.darkText),
    ),
    cardTheme: CardThemeData(
      color: AppColors.darkSurface,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brandAccent,
        foregroundColor: AppColors.white,
        elevation: 0,
        shadowColor: AppColors.brandAccent.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.sp),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        textStyle: 16.w600,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.brandAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: Dimens.mediumSizeText.w400.copyWith(
        color: AppColors.darkTextMuted,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.brandAccent, width: 2),
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
      fillColor: AppColors.darkSurface.withValues(alpha:0.5),
      iconColor: AppColors.darkTextMuted,
      prefixIconColor: AppColors.darkTextMuted,
      suffixIconColor: AppColors.darkTextMuted,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.darkSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.sp)),
      ),
    ),
  );

  final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Inter',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.brandAccent,
      primary: AppColors.brandAccent,
      secondary: AppColors.brandTerracotta,
      surface: AppColors.lightSurface,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.lightText,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.lightBg,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightSurface,
      centerTitle: false,
      elevation: 0,
      titleTextStyle: 16.w600.copyWith(color: AppColors.lightText),
      iconTheme: const IconThemeData(color: AppColors.lightText),
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightSurface,
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brandAccent,
        foregroundColor: AppColors.white,
        elevation: 0,
        shadowColor: AppColors.brandAccent.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.sp),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        textStyle: 16.w600,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.brandAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: Dimens.mediumSizeText.w400.copyWith(
        color: AppColors.lightTextMuted,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: const BorderSide(color: AppColors.brandAccent, width: 2),
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
      fillColor: Colors.black.withValues(alpha: 0.02),
      iconColor: AppColors.lightText,
      prefixIconColor: AppColors.lightText,
      suffixIconColor: AppColors.lightText,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.lightSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.lightSurface,
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
