import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/commerce/presentation/widgets/book_format_features.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';

class FormatSelectionScreen extends StatefulWidget {
  static const String path = '/format-selection/:bookId';
  static const String name = 'FormatSelectionScreen';

  final String bookId;

  const FormatSelectionScreen({super.key, required this.bookId});

  @override
  State<FormatSelectionScreen> createState() => _FormatSelectionScreenState();
}

class _FormatSelectionScreenState extends State<FormatSelectionScreen> {
  bool _isDigitalSelected = true;

  // Mock data
  final String _bookTitle = 'Things Fall Apart';
  final String _bookAuthor = 'Chinua Achebe';
  final String _bookCoverUrl =
      'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=200&auto=format&fit=crop';
  final double _bookRating = 4.8;
  final String _bookReviewCount = '12.4k';
  final String _digitalPrice = '\$9.99';
  final String _physicalPrice = '\$24.99';
  final String _originalDigitalPrice = '\$14.99';

  Future<void> _handleContinue() async {
    // Navigate to checkout screen
    context.push('/checkout/${widget.bookId}');
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
                title: context.l10n.chooseFormat,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.network(
                            _bookCoverUrl,
                            width: 96.w,
                            height: 124.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 96.w,
                                height: 124.h,
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
                                _bookTitle,
                                style: textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Merriweather',
                                  color: colorScheme.onSurface,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                _bookAuthor,
                                style: textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16.sp,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    _bookRating.toString(),
                                    style: textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onSurface,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    '($_bookReviewCount)',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDigitalSelected = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          border: Border.all(
                            color: _isDigitalSelected
                                ? colorScheme.primary
                                : colorScheme.outline.withValues(alpha: 0.2),
                            width: _isDigitalSelected ? 2.w : 1.w,
                          ),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        padding: EdgeInsets.all(24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 64.w,
                                  height: 64.w,
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Icon(
                                    Icons.phonelink_rounded,
                                    color: colorScheme.primary,
                                    size: 32.sp,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        context.l10n.digitalEdition,
                                        style: textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.onSurface,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        context.l10n.readOnAnyDevice,
                                        style: textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 24.w,
                                  height: 24.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: _isDigitalSelected
                                          ? colorScheme.primary
                                          : colorScheme.outline,
                                      width: 2.w,
                                    ),
                                    color: _isDigitalSelected
                                        ? colorScheme.primary
                                        : Colors.transparent,
                                  ),
                                  child: _isDigitalSelected
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 16.sp,
                                        )
                                      : null,
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            BookFormatFeatures(
                              features: [
                                context.l10n.offlineReading,
                                context.l10n.syncAcrossDevices,
                                context.l10n.highlightsNotes,
                              ],
                              iconColor: colorScheme.primary,
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _digitalPrice,
                                  style: textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 4.h),
                                  child: Text(
                                    _originalDigitalPrice,
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isDigitalSelected = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          border: Border.all(
                            color: !_isDigitalSelected
                                ? colorScheme.primary
                                : colorScheme.outline.withValues(alpha: 0.2),
                            width: !_isDigitalSelected ? 2.w : 1.w,
                          ),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        padding: EdgeInsets.all(24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 64.w,
                                  height: 64.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Icon(
                                    Icons.menu_book_rounded,
                                    color: Colors.grey,
                                    size: 32.sp,
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        context.l10n.hardcopy,
                                        style: textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.onSurface,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        context.l10n.printedAndDelivered,
                                        style: textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 24.w,
                                  height: 24.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: !_isDigitalSelected
                                          ? colorScheme.primary
                                          : colorScheme.outline,
                                      width: 2.w,
                                    ),
                                    color: !_isDigitalSelected
                                        ? colorScheme.primary
                                        : Colors.transparent,
                                  ),
                                  child: !_isDigitalSelected
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 16.sp,
                                        )
                                      : null,
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            BookFormatFeatures(
                              features: [
                                context.l10n.premiumPaperQuality,
                                context.l10n.deliveryInDays,
                                context.l10n.freeShipping,
                              ],
                              iconColor: Colors.grey,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              _physicalPrice,
                              style: textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
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
              child: PrimaryButton(
                text: context.l10n.continueToCheckout,
                onPressed: _handleContinue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
