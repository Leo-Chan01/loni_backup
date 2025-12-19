import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class SmallBookCard extends StatelessWidget {
  const SmallBookCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.onTap,
  });

  final String title;
  final String price;
  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              width: double.infinity,
              height: 140.h,
              color: colorScheme.surfaceContainerHighest,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedImageNotFound01,
                    color: colorScheme.onSurfaceVariant,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2.h),
          Text(
            price,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
