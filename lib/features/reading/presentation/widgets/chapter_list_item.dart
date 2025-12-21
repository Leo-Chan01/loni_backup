import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/chapter_model.dart';

class ChapterListItem extends StatelessWidget {
  final ChapterModel chapter;
  final VoidCallback onTap;

  const ChapterListItem({
    super.key,
    required this.chapter,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: chapter.isCurrentChapter
              ? colorScheme.primary.withValues(alpha: 0.1)
              : colorScheme.surface,
          border: Border(
            left: BorderSide(
              color: chapter.isCurrentChapter
                  ? colorScheme.primary
                  : Colors.transparent,
              width: 4.w,
            ),
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.only(bottom: 12.h),
        child: Row(
          children: [
            // Chapter Number
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: chapter.isCurrentChapter
                    ? colorScheme.primary.withValues(alpha: 0.2)
                    : colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  chapter.number.toString(),
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: chapter.isCurrentChapter
                        ? colorScheme.primary
                        : colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),

            // Chapter Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapter.title,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    chapter.isCurrentChapter
                        ? '${context.l10n.currentlyReading} • ${context.l10n.complete((chapter.progress * 100).toInt())}'
                        : context.l10n.pagesCount(chapter.pageCount),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // Play Icon
            if (chapter.isCurrentChapter)
              Icon(Icons.play_arrow, color: colorScheme.primary, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
