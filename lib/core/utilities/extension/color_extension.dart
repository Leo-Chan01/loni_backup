import 'package:loni_africa/config/theme/theme.dart';
import 'package:loni_africa/config/theme/color.dart';

import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color of(BuildContext context, {Color? dark}) {
    var contrast = AppColor.contrastColor(this);
    if (AppTheme.isDarkMode(context)) {
      return dark ?? contrast;
    }
    return this;
  }
}
