import 'package:loni_africa/config/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumberExtension on num {
  TextStyle get w100 {
    return TextStyle(
      fontSize: sp,
      fontWeight: FontWeight.w100,
      fontFamily: AppStrings.ahFontFamilyName,
    );
  }

  TextStyle get w200 {
    return TextStyle(
      fontSize: sp,
      fontWeight: FontWeight.w200,
      fontFamily: AppStrings.ahFontFamilyName,
    );
  }

  TextStyle get w300 {
    return TextStyle(
      fontSize: sp,
      fontWeight: FontWeight.w300,
      fontFamily: AppStrings.ahFontFamilyName,
    );
  }

  TextStyle get w400 {
    return TextStyle(
      fontSize: sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppStrings.ahFontFamilyName,
    );
  }

  TextStyle get regular {
    return TextStyle(
      fontSize: sp,
      fontWeight: FontWeight.w500,
      fontFamily: AppStrings.ahFontFamilyName,
    );
  }

  TextStyle get w600 {
    return TextStyle(
      fontSize: sp,
      fontWeight: FontWeight.w600,
      fontFamily: AppStrings.ahFontFamilyName,
    );
  }

  TextStyle get w700 {
    return TextStyle(
      fontSize: sp,
      fontWeight: FontWeight.w700,
      fontFamily: AppStrings.ahFontFamilyName,
    );
  }

  TextStyle get w800 {
    return TextStyle(
      fontSize: sp,
      fontWeight: FontWeight.w800,
      fontFamily: AppStrings.ahFontFamilyName,
    );
  }

  TextStyle get w900 {
    return TextStyle(
      fontSize: sp,
      fontWeight: FontWeight.w900,
      fontFamily: AppStrings.ahFontFamilyName,
    );
  }

  TextStyle get bold {
    return TextStyle(
      fontSize: sp,
      fontWeight: FontWeight.bold,
      fontFamily: AppStrings.ahFontFamilyName,
    );
  }
}
