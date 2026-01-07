import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/commerce/domain/models/order_model.dart';
import 'package:loni_africa/features/commerce/domain/models/order_status_model.dart';
import 'package:loni_africa/features/commerce/domain/models/payment_model.dart';
import 'package:loni_africa/features/commerce/presentation/widgets/order_item_card.dart';
import 'package:loni_africa/features/library/data/services/library_api_service.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';

class OrdersListScreen extends StatefulWidget {
  static const String path = '/orders';
  static const String name = 'OrdersListScreen';

  const OrdersListScreen({super.key});

  @override
  State<OrdersListScreen> createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends State<OrdersListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final LibraryApiService _libraryApiService;
  int _selectedTabIndex = 0;
  List<Order> _allOrders = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
    _libraryApiService = LibraryApiService();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    if (!mounted) return;
    try {
      final orders = await _libraryApiService.getOrders();
      if (!mounted) return;

      // Map library orders to commerce orders
      final mappedOrders = orders.map((order) {
        return Order(
          id: order.orderId,
          orderNumber: 'ORD-${order.orderId.substring(0, 3).toUpperCase()}',
          item: OrderItem(
            bookId: order.items.isNotEmpty ? order.items[0].catalogItemId : '',
            bookTitle:
                order.items.isNotEmpty ? order.items[0].title : 'Unknown',
            bookAuthor: 'Author',
            bookCoverUrl: null,
            orderType: order.items.isNotEmpty &&
                    order.items[0].fulfillmentType == 'DIGITAL'
                ? OrderType.digital
                : OrderType.physical,
            price: (order.totalCents / 100).toDouble(),
          ),
          status: _mapOrderStatus(order.status),
          payment: Payment(
            id: 'pay-${order.orderId}',
            transactionId: 'TXN-${order.orderId.substring(0, 6).toUpperCase()}',
            amount: (order.totalCents / 100).toDouble(),
            processingFee: 0,
            status: PaymentStatus.completed,
            paymentMethod: 'LONI Pay',
            phoneNumber: '',
            createdAt: order.createdAt,
            completedAt: order.createdAt,
          ),
          createdAt: order.createdAt,
        );
      }).toList();

      setState(() {
        _allOrders = mappedOrders;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load orders';
      });
    }
  }

  OrderStatus _mapOrderStatus(String status) {
    switch (status.toUpperCase()) {
      case 'COMPLETED':
      case 'FULFILLED':
        return OrderStatus.delivered;
      case 'PENDING':
        return OrderStatus.pending;
      case 'SHIPPED':
        return OrderStatus.inTransit;
      case 'PAID':
        return OrderStatus.inTransit;
      default:
        return OrderStatus.pending;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Order> get _filteredOrders {
    switch (_selectedTabIndex) {
      case 0: // All
        return _allOrders;
      case 1: // Completed
        return _allOrders.where((order) => order.status.isCompleted).toList();
      case 2: // Digital
        return _allOrders.where((order) => order.isDigital).toList();
      case 3: // Hardcopy
        return _allOrders.where((order) => !order.isDigital).toList();
      default:
        return _allOrders;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: colorScheme.primary,
          ),
        ),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(title: Text(context.l10n.myOrders)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedAlertCircle,
                size: 48.r,
                color: colorScheme.error,
              ),
              SizedBox(height: 16.h),
              Text(
                _errorMessage!,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                  _loadOrders();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                ),
                child: Text(context.l10n.retry),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ScreenHeader(
                title: context.l10n.myOrders,
                subtitle: '',
                showBackButton: true,
                onBackPressed: () => context.pop(),
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: colorScheme.onSurfaceVariant,
                labelStyle: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: textTheme.labelLarge,
                padding: EdgeInsets.all(4.w),
                tabs: [
                  Tab(text: context.l10n.filter),
                  Tab(text: context.l10n.completed),
                  Tab(text: context.l10n.digital),
                  Tab(text: context.l10n.hardcopy),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: _filteredOrders.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 80.sp,
                            color: colorScheme.onSurfaceVariant.withValues(
                              alpha: 0.3,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'No orders found',
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: _filteredOrders.length,
                      itemBuilder: (context, index) {
                        final order = _filteredOrders[index];
                        return OrderItemCard(
                          order: order,
                          onTrackOrder: () {
                            context.push('/track-order/${order.id}');
                          },
                          onReadNow: () {
                            // Navigate to reader
                          },
                          onRateReview: () {
                            // Show rating dialog
                          },
                          onBuyAgain: () {
                            // Navigate to book details
                          },
                          onContactSupport: () {
                            // Show support options
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}