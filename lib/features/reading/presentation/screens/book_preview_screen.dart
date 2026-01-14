import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/presentation/provider/book_preview_provider.dart';
import 'package:loni_africa/features/reading/presentation/widgets/preview_banner.dart';
import 'package:loni_africa/features/reading/presentation/widgets/preview_end_notice.dart';

class BookPreviewScreen extends StatelessWidget {
  final String bookId;

  const BookPreviewScreen({super.key, required this.bookId});

  static const String path = '/book-preview/:bookId';
  static const String name = 'BookPreviewScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookPreviewProvider(bookId: bookId),
      child: const _BookPreviewView(),
    );
  }
}

class _BookPreviewView extends StatelessWidget {
  const _BookPreviewView();

  Future<void> _handleBuyBook(BuildContext context, String bookId) async {
    context.push('/checkout/$bookId');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final provider = context.watch<BookPreviewProvider>();

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            PreviewBanner(
              onBuyPressed: () => _handleBuyBook(context, provider.bookId),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.95),
                border: Border(
                  bottom: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedCancel01,
                      color: colorScheme.onSurface,
                      size: 24.sp,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          provider.book?.title ?? context.l10n.loading,
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                            fontFamily: 'Merriweather',
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          context.l10n.preview,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 24.w),
                ],
              ),
            ),

            Expanded(
              child: provider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: colorScheme.primary,
                      ),
                    )
                  : provider.error != null
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HugeIcon(
                              icon: HugeIcons.strokeRoundedAlert02,
                              color: colorScheme.error,
                              size: 48.sp,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              context.l10n.error,
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              provider.error!,
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 24.h),
                            TextButton.icon(
                              onPressed: provider.retry,
                              icon: HugeIcon(
                                icon: HugeIcons.strokeRoundedRefresh,
                                color: colorScheme.primary,
                              ),
                              label: Text(context.l10n.retry),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 24.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...provider.paragraphs.map(
                            (paragraph) => Padding(
                              padding: EdgeInsets.only(bottom: 20.h),
                              child: Text(
                                paragraph,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontFamily: 'Merriweather',
                                  height: 1.8,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          if (provider.book != null)
                            PreviewEndNotice(
                              totalPages: provider.book!.pageCount,
                              price:
                                  '${(provider.book!.priceCents / 100).toStringAsFixed(2)} ${provider.book!.currency}',
                              onBuyPressed: () =>
                                  _handleBuyBook(context, provider.bookId),
                            ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
