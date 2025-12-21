import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/offline_book_model.dart';

class DownloadedBookItem extends StatelessWidget {
  final OfflineBookModel book;
  final VoidCallback? onDelete;

  const DownloadedBookItem({super.key, required this.book, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          // Book Cover
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              book.coverImageUrl,
              width: 48.w,
              height: 64.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 48.w,
                  height: 64.h,
                  color: colorScheme.surfaceContainerHighest,
                  child: Icon(
                    Icons.book,
                    size: 24.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 16.w),

          // Book Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  book.author,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 8.h),

                // Status
                if (book.status == DownloadStatus.downloaded)
                  Row(
                    children: [
                      Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '${context.l10n.downloadedStatus} • ${book.fileSize}',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  )
                else if (book.status == DownloadStatus.downloading)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 4.h,
                              decoration: BoxDecoration(
                                color: colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: book.downloadProgress,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary,
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            '${(book.downloadProgress * 100).toInt()}%',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          // Action Button
          GestureDetector(
            onTap: onDelete,
            child: Icon(
              book.status == DownloadStatus.downloading
                  ? Icons.pause
                  : Icons.delete_outline,
              color: colorScheme.onSurfaceVariant,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
