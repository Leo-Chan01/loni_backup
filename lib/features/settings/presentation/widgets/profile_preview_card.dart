import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfilePreviewCard extends StatelessWidget {
  final String fullName;
  final String email;
  final String? avatarUrl;
  final String viewProfileText;
  final VoidCallback onTap;
  final VoidCallback onViewProfile;

  const ProfilePreviewCard({
    super.key,
    required this.fullName,
    required this.email,
    required this.avatarUrl,
    required this.viewProfileText,
    required this.onTap,
    required this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final resolvedAvatarUrl = avatarUrl?.trim() ?? '';

    final avatarFallback = Container(
      width: 80.w,
      height: 80.h,
      color: colorScheme.primary.withValues(alpha: 0.1),
      child: Center(
        child: HugeIcon(
          icon: HugeIcons.strokeRoundedUser,
          size: 40.sp,
          color: colorScheme.primary,
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Material(
        color: colorScheme.surface.withValues(alpha: 0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
                  child: resolvedAvatarUrl.isEmpty
                      ? avatarFallback
                      : Image.network(
                          resolvedAvatarUrl,
                          width: 80.w,
                          height: 80.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return avatarFallback;
                          },
                        ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        fullName,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        email,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: onViewProfile,
                        child: Text(
                          viewProfileText,
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowRight01,
                  size: 20.sp,
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
