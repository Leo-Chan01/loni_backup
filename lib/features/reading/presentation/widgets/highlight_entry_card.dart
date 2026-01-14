import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/core/utilities/relative_time_formatter.dart';
import 'package:loni_africa/features/reading/domain/models/highlight_entry.dart';

class HighlightEntryCard extends StatelessWidget {
  const HighlightEntryCard({super.key, required this.highlight, this.onTap});

  final HighlightEntry highlight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final createdAt = highlight.createdAt;
    final timeLabel = createdAt != null
        ? RelativeTimeFormatter.format(context, createdAt)
        : null;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(20.w),
        margin: EdgeInsets.only(bottom: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 4.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        highlight.hasNote
                            ? context.l10n.notes
                            : context.l10n.highlights,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      if (highlight.text != null &&
                          highlight.text!.trim().isNotEmpty)
                        Text(
                          highlight.text!.trim(),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontStyle: FontStyle.italic,
                            height: 1.6,
                          ),
                        ),
                    ],
                  ),
                ),
                HugeIcon(
                  icon: HugeIcons.strokeRoundedMoreVertical,
                  color: colorScheme.onSurfaceVariant,
                  size: 20.sp,
                ),
              ],
            ),
            if (highlight.note != null &&
                highlight.note!.trim().isNotEmpty) ...[
              SizedBox(height: 12.h),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.all(12.w),
                child: Text(
                  highlight.note!.trim(),
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
            if (timeLabel != null) ...[
              SizedBox(height: 12.h),
              Text(
                context.l10n.savedAgo(timeLabel),
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
