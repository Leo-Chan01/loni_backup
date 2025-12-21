import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../profile/domain/models/bookmark_model.dart';
import '../../../../core/utilities/localization_extension.dart';

class BookmarkCard extends StatelessWidget {
  final Bookmark bookmark;
  final VoidCallback onShare;
  final VoidCallback onDelete;

  const BookmarkCard({
    super.key,
    required this.bookmark,
    required this.onShare,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final timeAgo = timeago.format(bookmark.savedAt);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56.w,
                height: 72.h,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Center(
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedBook02,
                    size: 24.r,
                    color: colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookmark.bookTitle,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      bookmark.bookAuthor,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${context.l10n.chapter} ${bookmark.chapterNumber} • ${context.l10n.page} ${bookmark.pageNumber}',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              '"${bookmark.quoteText}"',
              style: TextStyle(
                fontSize: 13.sp,
                fontStyle: FontStyle.italic,
                color: colorScheme.onSurface,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.savedAgo(timeAgo),
                style: TextStyle(
                  fontSize: 11.sp,
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onShare,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedShare08,
                        size: 18.r,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: onDelete,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedDelete02,
                        size: 18.r,
                        color: colorScheme.error,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
