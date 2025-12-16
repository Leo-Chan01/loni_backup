import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({
    super.key,
    required this.rating,
    this.starCount = 5,
    this.size,
  });

  final double rating;
  final int starCount;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconSize = size ?? 16.sp;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        final isFilled = rating >= index + 1;
        return Padding(
          padding: EdgeInsets.only(right: index == starCount - 1 ? 0 : 4.w),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedStar,
            color: isFilled
                ? colorScheme.primary
                : colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            size: iconSize,
          ),
        );
      }),
    );
  }
}
