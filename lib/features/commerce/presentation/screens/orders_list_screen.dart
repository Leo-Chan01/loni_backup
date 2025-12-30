import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/commerce/domain/models/delivery_address_model.dart';
import 'package:loni_africa/features/commerce/domain/models/order_model.dart';
import 'package:loni_africa/features/commerce/domain/models/order_status_model.dart';
import 'package:loni_africa/features/commerce/domain/models/payment_model.dart';
import 'package:loni_africa/features/commerce/presentation/widgets/order_item_card.dart';
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
  int _selectedTabIndex = 0;

  // Mock data
  final List<Order> _allOrders = [
    Order(
      id: '1',
      orderNumber: 'ORD-001',
      item: OrderItem(
        bookId: 'book1',
        bookTitle: 'Things Fall Apart',
        bookAuthor: 'Chinua Achebe',
        bookCoverUrl:
            'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=200&auto=format&fit=crop',
        orderType: OrderType.digital,
        price: 9.99,
      ),
      status: OrderStatus.delivered,
      payment: Payment(
        id: 'pay1',
        transactionId: 'TXN-001',
        amount: 9.99,
        processingFee: 0.50,
        status: PaymentStatus.completed,
        paymentMethod: 'MTN Mobile Money',
        phoneNumber: '+237 600 000 001',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        completedAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Order(
      id: '2',
      orderNumber: 'ORD-002',
      item: OrderItem(
        bookId: 'book2',
        bookTitle: 'Half of a Yellow Sun',
        bookAuthor: 'Chimamanda Ngozi Adichie',
        bookCoverUrl:
            'https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=200&auto=format&fit=crop',
        orderType: OrderType.physical,
        price: 24.99,
      ),
      status: OrderStatus.inTransit,
      payment: Payment(
        id: 'pay2',
        transactionId: 'TXN-002',
        amount: 24.99,
        processingFee: 1.25,
        status: PaymentStatus.completed,
        paymentMethod: 'Orange Money',
        phoneNumber: '+237 600 000 002',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        completedAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      deliveryAddress: DeliveryAddress(
        recipientName: 'John Doe',
        addressLine1: '123 Main St',
        addressLine2: '',
        city: 'Douala',
        region: 'Littoral',
        country: 'Cameroon',
        phoneNumber: '+237 600 000 002',
      ),
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Order(
      id: '3',
      orderNumber: 'ORD-003',
      item: OrderItem(
        bookId: 'book3',
        bookTitle: 'Americanah',
        bookAuthor: 'Chimamanda Ngozi Adichie',
        bookCoverUrl:
            'https://images.unsplash.com/photo-1532012197267-da84d127e765?q=80&w=200&auto=format&fit=crop',
        orderType: OrderType.digital,
        price: 12.99,
      ),
      status: OrderStatus.delivered,
      payment: Payment(
        id: 'pay3',
        transactionId: 'TXN-003',
        amount: 12.99,
        processingFee: 0.65,
        status: PaymentStatus.completed,
        paymentMethod: 'M-Pesa',
        phoneNumber: '+254 700 000 003',
        createdAt: DateTime.now().subtract(const Duration(days: 10)),
        completedAt: DateTime.now().subtract(const Duration(days: 10)),
      ),
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
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
