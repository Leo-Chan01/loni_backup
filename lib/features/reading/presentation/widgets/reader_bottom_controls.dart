import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
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
        color: colorScheme.surface.withValues(alpha: 0.95),
        border: Border(
          top: BorderSide(color: colorScheme.outline.withValues(alpha: 0.2)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ControlButton(
            icon: HugeIcons.strokeRoundedMenu01,
            label: context.l10n.contents,
            onTap: onContentsPressed,
            isDark: isDark,
          ),
          _ControlButton(
            icon: HugeIcons.strokeRoundedBookmark01,
            label: context.l10n.bookmark,
            onTap: onBookmarkPressed,
            isDark: isDark,
          ),
          _ControlButton(
            icon: HugeIcons.strokeRoundedBrush,
            label: context.l10n.highlight,
            onTap: onHighlightPressed,
            isActive: true,
            isDark: isDark,
          ),
          _ControlButton(
            icon: HugeIcons.strokeRoundedSettings01,
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
  final dynamic icon;
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
    final color = isActive ? colorScheme.primary : colorScheme.onSurface;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HugeIcon(icon: icon, color: color, size: 22.sp),
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
