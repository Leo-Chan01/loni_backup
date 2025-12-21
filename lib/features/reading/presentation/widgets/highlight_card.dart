import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/highlight_model.dart';

class HighlightCard extends StatelessWidget {
  final HighlightModel highlight;
  final VoidCallback? onShare;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const HighlightCard({
    super.key,
    required this.highlight,
    this.onShare,
    this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (highlight.type == HighlightType.bookmark) {
      return _BookmarkCard(
        highlight: highlight,
        onTap: onTap,
        onDelete: onDelete,
      );
    }

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
                        '${highlight.chapterTitle} • Page ${highlight.pageNumber}',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      if (highlight.text != null)
                        Text(
                          '"${highlight.text}"',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Merriweather',
                            height: 1.6,
                          ),
                        ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onDelete,
                  child: Icon(
                    Icons.more_vert,
                    color: colorScheme.onSurfaceVariant,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
            if (highlight.note != null) ...[
              SizedBox(height: 12.h),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.all(12.w),
                child: Text(
                  highlight.note!,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  highlight.relativeTime,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                if (onShare != null)
                  GestureDetector(
                    onTap: onShare,
                    child: Row(
                      children: [
                        Icon(
                          Icons.share,
                          color: colorScheme.primary,
                          size: 16.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          context.l10n.share,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BookmarkCard extends StatelessWidget {
  final HighlightModel highlight;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const _BookmarkCard({required this.highlight, this.onTap, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
                Icon(Icons.bookmark, color: colorScheme.primary, size: 20.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${highlight.chapterTitle} • Page ${highlight.pageNumber}',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        context.l10n.bookmarkedPage,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onDelete,
                  child: Icon(
                    Icons.more_vert,
                    color: colorScheme.onSurfaceVariant,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  highlight.relativeTime,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  context.l10n.goToPage,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
