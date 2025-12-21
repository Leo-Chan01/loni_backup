import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';

class ReaderBottomControls extends StatelessWidget {
  final VoidCallback onContentsPressed;
  final VoidCallback onBookmarkPressed;
  final VoidCallback onHighlightPressed;
  final VoidCallback onSettingsPressed;
  final bool isDark;

  const ReaderBottomControls({
    super.key,
    required this.onContentsPressed,
    required this.onBookmarkPressed,
    required this.onHighlightPressed,
    required this.onSettingsPressed,
    this.isDark = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: isDark
            ? colorScheme.surface.withValues(alpha: 0.95)
            : Colors.white.withValues(alpha: 0.95),
        border: Border(
          top: BorderSide(
            color: isDark
                ? colorScheme.outline.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.2),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ControlButton(
            icon: Icons.list,
            label: context.l10n.contents,
            onTap: onContentsPressed,
            isDark: isDark,
          ),
          _ControlButton(
            icon: Icons.bookmark,
            label: context.l10n.bookmark,
            onTap: onBookmarkPressed,
            isDark: isDark,
          ),
          _ControlButton(
            icon: Icons.brush,
            label: context.l10n.highlight,
            onTap: onHighlightPressed,
            isActive: true,
            isDark: isDark,
          ),
          _ControlButton(
            icon: Icons.settings,
            label: context.l10n.readingSettings,
            onTap: onSettingsPressed,
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final bool isDark;

  const _ControlButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isActive = false,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final color = isActive
        ? colorScheme.primary
        : (isDark ? colorScheme.onSurface : Colors.grey[900]!);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 22.sp),
          SizedBox(height: 4.h),
          Text(
            label,
            style: textTheme.labelSmall?.copyWith(color: color, fontSize: 9.sp),
          ),
        ],
      ),
    );
  }
}
