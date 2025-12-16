import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const String path = 'categories';
  static const String name = 'CategoriesScreen';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeNotifier = ThemeNotifier.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  ScreenHeader(
                    title: 'Categories',
                    subtitle: 'Browse by genre',
                    showBackButton: true,
                    trailingWidget: ThemeToggleButton(
                      onToggle: themeNotifier.onToggle,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Categories content goes here',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
