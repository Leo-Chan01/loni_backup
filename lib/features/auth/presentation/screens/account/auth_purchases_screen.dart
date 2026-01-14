import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utilities/localization_extension.dart';
import '../../../../../shared/widgets/state_message_view.dart';
import '../../provider/auth_account_provider.dart';

class AuthPurchasesScreen extends StatefulWidget {
  const AuthPurchasesScreen({super.key});

  static const String name = 'auth-purchases';
  static const String path = '/auth/purchases';

  @override
  State<AuthPurchasesScreen> createState() => _AuthPurchasesScreenState();
}

class _AuthPurchasesScreenState extends State<AuthPurchasesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthAccountProvider>().loadPurchases();
    });
  }

  String _labelForPurchase(Map<String, dynamic> purchase) {
    final title = purchase['title'] ?? purchase['bookTitle'];
    final amount = purchase['amount'] ?? purchase['priceCents'];
    final currency = purchase['currency'];

    final parts = <String>[];
    if (title != null && title.toString().isNotEmpty) parts.add(title.toString());
    if (amount != null) {
      final money = currency != null
          ? '${amount.toString()} ${currency.toString()}'
          : amount.toString();
      parts.add(money);
    }

    if (parts.isNotEmpty) return parts.join(' • ');

    final id = purchase['id'] ?? purchase['orderId'];
    if (id != null) return id.toString();

    return purchase.toString();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final provider = context.watch<AuthAccountProvider>();

    final purchases = provider.purchases;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: colorScheme.onSurface,
            size: 24.sp,
          ),
        ),
        title: Text(l10n.purchaseHistory),
        actions: [
          IconButton(
            onPressed: provider.isLoading
                ? null
                : () => context.read<AuthAccountProvider>().loadPurchases(),
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedRefresh,
              color: colorScheme.onSurface,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: provider.isLoading && purchases.isEmpty
          ? Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            )
          : purchases.isEmpty
          ? Center(
              child: StateMessageView(
                title: l10n.noPurchases,
                message: l10n.noPurchasesDesc,
                actionText: l10n.refresh,
                onAction: () => context.read<AuthAccountProvider>().loadPurchases(),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(20.w),
              itemCount: purchases.length,
              separatorBuilder: (_, _) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                final purchase = purchases[index];
                final id = (purchase['id'] ?? purchase['orderId'])?.toString();

                return Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  child: ListTile(
                    title: Text(_labelForPurchase(purchase)),
                    subtitle: id == null ? null : Text(id),
                  ),
                );
              },
            ),
    );
  }
}
