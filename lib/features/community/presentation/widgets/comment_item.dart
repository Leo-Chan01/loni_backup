import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../community/domain/models/comment_model.dart';
import '../../../../core/utilities/localization_extension.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  final int depth;

  const CommentItem({super.key, required this.comment, this.depth = 0});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final timeAgo = timeago.format(comment.createdAt);
    final isReply = depth > 0;

    return Container(
      margin: EdgeInsets.only(left: depth * 32.w, bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: isReply ? 16.r : 18.r,
            backgroundColor: colorScheme.surfaceContainer,
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedUser,
              size: isReply ? 16.r : 18.r,
              color: colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.userFullName,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      comment.username,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      timeAgo,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: colorScheme.onSurface.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  comment.content,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: colorScheme.onSurface,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          HugeIcon(
                            icon: comment.isLikedByCurrentUser
                                ? HugeIcons.strokeRoundedFavourite
                                : HugeIcons.strokeRoundedFavourite,
                            size: 16.r,
                            color: comment.isLikedByCurrentUser
                                ? Colors.red
                                : colorScheme.onSurface.withValues(alpha: 0.5),
                          ),
                          if (comment.likesCount > 0) ...[
                            SizedBox(width: 4.w),
                            Text(
                              comment.likesCount.toString(),
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        context.l10n.reply,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                if (comment.replies.isNotEmpty) ...[
                  SizedBox(height: 12.h),
                  ...comment.replies.map(
                    (reply) => CommentItem(comment: reply, depth: depth + 1),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
