import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class BookGridItem extends StatelessWidget {
  final String id;
  final String title;
  final String author;
  final String coverImageUrl;
  final double rating;
  final double? price;
  final bool isPurchased;

  const BookGridItem({
    super.key,
    required this.id,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.rating,
    this.price,
    this.isPurchased = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => context.push('/book-detail/$id'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Cover
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: colorScheme.surfaceContainer,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                    coverImageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: colorScheme.surfaceContainer,
                        child: Center(
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedBook01,
                            color: colorScheme.onSurface.withValues(alpha: 0.3),
                            size: 48.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Badge for purchased
                if (isPurchased)
                  Positioned(
                    top: 8.w,
                    right: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        'Owned',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          // Book Title
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 4.h),
          // Author
          Text(
            author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(height: 8.h),
          // Rating and Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Rating
              Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedFavourite,
                    color: Colors.amber,
                    size: 14.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              // Price
              if (price != null)
                Text(
                  '\₦${price!.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primary,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
