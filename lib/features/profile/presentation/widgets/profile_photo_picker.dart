import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class ProfilePhotoPicker extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback onTap;

  const ProfilePhotoPicker({super.key, this.avatarUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60.r,
            backgroundColor: colorScheme.surfaceContainer,
            child: avatarUrl == null || avatarUrl!.isEmpty
                ? HugeIcon(
                    icon: HugeIcons.strokeRoundedUser,
                    size: 60.r,
                    color: colorScheme.onSurface.withValues(alpha: 0.4),
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: colorScheme.surface, width: 2.w),
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedCamera01,
                  color: colorScheme.onPrimary,
                  size: 18.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
