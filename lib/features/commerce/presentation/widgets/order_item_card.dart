import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/commerce/domain/models/order_model.dart';
import 'package:loni_africa/features/commerce/domain/models/order_status_model.dart';

class OrderItemCard extends StatelessWidget {
  final Order order;
  final VoidCallback? onTrackOrder;
  final VoidCallback? onReadNow;
  final VoidCallback? onRateReview;
  final VoidCallback? onBuyAgain;
  final VoidCallback? onContactSupport;

  const OrderItemCard({
    super.key,
    required this.order,
    this.onTrackOrder,
    this.onReadNow,
    this.onRateReview,
    this.onBuyAgain,
    this.onContactSupport,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  order.item.bookCoverUrl ?? '',
                  width: 56.w,
                  height: 72.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 56.w,
                      height: 72.h,
                      color: colorScheme.surfaceContainerHighest,
                      child: Icon(
                        Icons.book,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.item.bookTitle,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merriweather',
                        color: colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      order.item.bookAuthor,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(order.status).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        order.status.displayName,
                        style: textTheme.bodySmall?.copyWith(
                          color: _getStatusColor(order.status),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '\$${order.item.price.toStringAsFixed(2)}',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              if (order.isDigital && order.status.isCompleted) ...[
                Expanded(
                  child: _buildActionButton(
                    context.l10n.readNow,
                    Icons.menu_book_outlined,
                    colorScheme.primary,
                    onReadNow,
                    colorScheme,
                    textTheme,
                  ),
                ),
              ] else if (!order.isDigital && order.status.isActive) ...[
                Expanded(
                  child: _buildActionButton(
                    context.l10n.trackOrder,
                    Icons.location_on_outlined,
                    colorScheme.primary,
                    onTrackOrder,
                    colorScheme,
                    textTheme,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: _buildActionButton(
                    context.l10n.contactSupport,
                    Icons.headset_mic_outlined,
                    colorScheme.onSurfaceVariant,
                    onContactSupport,
                    colorScheme,
                    textTheme,
                  ),
                ),
              ] else if (order.status.isCompleted) ...[
                Expanded(
                  child: _buildActionButton(
                    context.l10n.rateAndReview,
                    Icons.star_outline,
                    colorScheme.primary,
                    onRateReview,
                    colorScheme,
                    textTheme,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: _buildActionButton(
                    context.l10n.buyAgain,
                    Icons.refresh,
                    colorScheme.onSurfaceVariant,
                    onBuyAgain,
                    colorScheme,
                    textTheme,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    String text,
    IconData icon,
    Color color,
    VoidCallback? onPressed,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Material(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: 18.sp,
              ),
              SizedBox(width: 6.w),
              Text(
                text,
                style: textTheme.labelLarge?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
      case OrderStatus.confirmed:
      case OrderStatus.processing:
        return Colors.orange;
      case OrderStatus.shipped:
      case OrderStatus.inTransit:
      case OrderStatus.outForDelivery:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
      case OrderStatus.refunded:
        return Colors.red;
    }
  }
}
