import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/loni_search_bar.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';

class SearchTopBar extends StatelessWidget {
  const SearchTopBar({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeNotifier = ThemeNotifier.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_rounded, color: colorScheme.onSurface),
          splashRadius: 20.r,
        ),
        Expanded(
          child: LoniSearchBar(
            controller: controller,
            autoFocus: true,
            onSubmitted: onSubmitted,
          ),
        ),
        SizedBox(width: 8.w),
        ThemeToggleButton(onToggle: themeNotifier.onToggle),
      ],
    );
  }
}
