import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/library/data/services/library_api_service.dart';
import 'package:loni_africa/features/library/domain/models/order.dart';
import 'package:loni_africa/features/library/presentation/controllers/library_controller.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/empty_state_widget.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  static const String path = '/app/library';
  static const String name = 'LibraryScreen';

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late final LibraryController _controller;
  List<Order> _books = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _controller = LibraryController(LibraryApiService());
    _loadUserBooks();
  }

  Future<void> _loadUserBooks() async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    try {
      final orders = await _controller.getUserBooks();
      if (mounted) {
        setState(() {
          _books = orders;
          _errorMessage = null;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeNotifier = ThemeNotifier.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      ScreenHeader(
                        title: context.l10n.library,
                        subtitle: context.l10n.myBooks,
                        showBackButton: false,
                        trailingWidget: ThemeToggleButton(
                          onToggle: themeNotifier.onToggle,
                        ),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
                Expanded(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: colorScheme.primary,
                          ),
                        )
                      : _errorMessage != null
                          ? Center(
                              child: EmptyStateWidget(
                                title: context.l10n.error,
                                message: _errorMessage!,
                                iconData: Icons.error_outline,
                              ),
                            )
                          : _books.isEmpty
                              ? EmptyStateWidget(
                                  title: context.l10n.library,
                                  message: 'No books found',
                                  iconData: Icons.library_books,
                                )
                              : ListView.builder(
                                  itemCount: _books.length,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 8.h,
                                  ),
                                  itemBuilder: (context, index) {
                                    final order = _books[index];
                                    return _buildOrderCard(
                                      context,
                                      order,
                                      colorScheme,
                                    );
                                  },
                                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(
    BuildContext context,
    Order order,
    ColorScheme colorScheme,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: colorScheme.outlineVariant,
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.orderFilter + order.orderId,
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 8.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.items.length,
              itemBuilder: (context, index) {
                final item = order.items[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${(order.totalCents / 100).toStringAsFixed(2)} ${order.currency}',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: _getStatusColor(order.status, colorScheme),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    order.status,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status, ColorScheme colorScheme) {
    switch (status.toUpperCase()) {
      case 'PAID':
        return colorScheme.primary;
      case 'FULFILLED':
        return Colors.green;
      case 'PENDING':
        return Colors.orange;
      default:
        return colorScheme.secondary;
    }
  }
}
