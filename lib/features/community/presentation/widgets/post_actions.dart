import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utilities/localization_extension.dart';

class PostActions extends StatelessWidget {
  final int likesCount;
  final int commentsCount;
  final bool isLiked;
  final bool isBookmarked;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onBookmark;
  final VoidCallback onShare;

  const PostActions({
    super.key,
    required this.likesCount,
    required this.commentsCount,
    required this.isLiked,
    required this.isBookmarked,
    required this.onLike,
    required this.onComment,
    required this.onBookmark,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        GestureDetector(
          onTap: onLike,
          child: Row(
            children: [
              HugeIcon(
                icon: isLiked
                    ? HugeIcons.strokeRoundedFavourite
                    : HugeIcons.strokeRoundedFavourite,
                size: 20.r,
                color: isLiked
                    ? Colors.red
                    : colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              SizedBox(width: 4.w),
              Text(
                context.l10n.likes(likesCount),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.w),
        GestureDetector(
          onTap: onComment,
          child: Row(
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedComment02,
                size: 20.r,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              SizedBox(width: 4.w),
              Text(
                context.l10n.comments(commentsCount),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onBookmark,
          child: HugeIcon(
            icon: isBookmarked
                ? HugeIcons.strokeRoundedBookmark02
                : HugeIcons.strokeRoundedBookmark01,
            size: 20.r,
            color: isBookmarked
                ? colorScheme.primary
                : colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: onShare,
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedShare08,
            size: 20.r,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
