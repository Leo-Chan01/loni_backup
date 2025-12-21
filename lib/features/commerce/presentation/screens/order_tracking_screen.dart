import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/commerce/domain/models/delivery_address_model.dart';
import 'package:loni_africa/features/commerce/domain/models/tracking_event_model.dart';
import 'package:loni_africa/shared/widgets/secondary_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';

class OrderTrackingScreen extends StatelessWidget {
  static const String path = '/track-order/:orderId';
  static const String name = 'OrderTrackingScreen';

  final String orderId;

  const OrderTrackingScreen({
    super.key,
    required this.orderId,
  });

  // Mock data
  static const String _bookTitle = 'Half of a Yellow Sun';
  static const String _orderDate = '12 March 2024';
  static const int _estimatedDays = 2;

  static final List<TrackingEvent> _trackingEvents = [
    TrackingEvent(
      title: 'Order Confirmed',
      description: 'Payment received',
      timestamp: DateTime(2024, 3, 12, 10, 30),
      isCompleted: true,
      isActive: false,
    ),
    TrackingEvent(
      title: 'Processing',
      description: 'Order being prepared',
      timestamp: DateTime(2024, 3, 12, 14, 15),
      isCompleted: true,
      isActive: false,
    ),
    TrackingEvent(
      title: 'Shipped',
      description: 'Picked up by courier',
      timestamp: DateTime(2024, 3, 13, 9, 0),
      isCompleted: true,
      isActive: false,
    ),
    TrackingEvent(
      title: 'In Transit',
      description: 'Arrived at sorting facility',
      timestamp: DateTime(2024, 3, 14, 11, 30),
      isCompleted: true,
      isActive: false,
    ),
    TrackingEvent(
      title: 'Out for Delivery',
      description: 'Package on the way',
      timestamp: DateTime(2024, 3, 15, 8, 0),
      isCompleted: false,
      isActive: true,
    ),
  ];

  static final DeliveryAddress _deliveryAddress = DeliveryAddress(
    recipientName: 'John Doe',
    addressLine1: '123 Main Street',
    addressLine2: 'Apt 4B',
    city: 'Douala',
    region: 'Littoral',
    country: 'Cameroon',
    phoneNumber: '+237 600 000 002',
    postalCode: '00237',
  );

  Future<void> _handleContactSupport(BuildContext context) async {
    // Show support options
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ScreenHeader(
                title: context.l10n.trackOrderTitle,
                subtitle: '',
                showBackButton: true,
                onBackPressed: () => context.pop(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Text(
                      _bookTitle,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merriweather',
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      context.l10n.placedOn(_orderDate),
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            colorScheme.primary,
                            colorScheme.tertiary,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.estimatedDelivery,
                            style: textTheme.titleMedium?.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            context.l10n.orderWillArriveIn(_estimatedDays),
                            style: textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      context.l10n.trackingHistory,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ..._trackingEvents.asMap().entries.map((entry) {
                      final index = entry.key;
                      final event = entry.value;
                      final isLast = index == _trackingEvents.length - 1;
                      return _buildTrackingEventItem(
                        event,
                        isLast,
                        colorScheme,
                        textTheme,
                      );
                    }),
                    SizedBox(height: 32.h),
                    Text(
                      context.l10n.deliveryAddress,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
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
                              Container(
                                width: 48.w,
                                height: 48.w,
                                decoration: BoxDecoration(
                                  color: colorScheme.primary.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Icon(
                                  Icons.location_on,
                                  color: colorScheme.primary,
                                  size: 24.sp,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Text(
                                  _deliveryAddress.recipientName,
                                  style: textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            _deliveryAddress.fullAddress,
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                size: 16.sp,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                _deliveryAddress.phoneNumber,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.95),
                border: Border(
                  top: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
              child: SecondaryButton(
                text: context.l10n.contactSupport,
                onPressed: () => _handleContactSupport(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackingEventItem(
    TrackingEvent event,
    bool isLast,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: event.isCompleted || event.isActive
                      ? colorScheme.primary
                      : colorScheme.surfaceContainerHighest,
                  border: Border.all(
                    color: event.isCompleted || event.isActive
                        ? colorScheme.primary
                        : colorScheme.outline,
                    width: 2.w,
                  ),
                ),
                child: event.isCompleted
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16.sp,
                      )
                    : event.isActive
                        ? Container(
                            margin: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          )
                        : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2.w,
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: event.isCompleted
                            ? [colorScheme.primary, colorScheme.primary]
                            : [
                                colorScheme.outline.withValues(alpha: 0.3),
                                colorScheme.outline.withValues(alpha: 0.3),
                              ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: event.isActive
                          ? colorScheme.primary
                          : colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    event.description,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    _formatTimestamp(event.timestamp),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    final month = months[timestamp.month - 1];
    final day = timestamp.day;
    final hour = timestamp.hour.toString().padLeft(2, '0');
    final minute = timestamp.minute.toString().padLeft(2, '0');
    return '$month $day, $hour:$minute';
  }
}
