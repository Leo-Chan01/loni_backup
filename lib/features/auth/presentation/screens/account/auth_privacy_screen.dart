import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utilities/localization_extension.dart';
import '../../../../../shared/widgets/confirm_dialog.dart';
import '../../../../../shared/widgets/global_snackbar.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../provider/auth_account_provider.dart';

class AuthPrivacyScreen extends StatelessWidget {
  const AuthPrivacyScreen({super.key});

  static const String name = 'auth-privacy';
  static const String path = '/auth/privacy';

  Future<void> _requestExport(BuildContext context) async {
    final provider = context.read<AuthAccountProvider>();
    final l10n = context.l10n;

    final result = await provider.requestPrivacyExport();

    if (!context.mounted) return;
    if (provider.errorMessage == null) {
      final id = result?['id'] ?? result?['requestId'];
      GlobalSnackBar.showSuccess(
        id == null ? l10n.exportRequested : l10n.exportRequestedWithId(id),
      );
    } else {
      GlobalSnackBar.showError(provider.errorMessage!);
    }
  }

  Future<void> _requestDelete(BuildContext context) async {
    final provider = context.read<AuthAccountProvider>();
    final l10n = context.l10n;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => ConfirmDialog(
        title: l10n.requestAccountDeletionTitle,
        message: l10n.requestAccountDeletionMessage,
        confirmText: l10n.delete,
        cancelText: l10n.cancel,
        isDestructive: true,
      ),
    );

    if (confirmed != true) return;

    final result = await provider.requestPrivacyDelete();

    if (!context.mounted) return;
    if (provider.errorMessage == null) {
      final id = result?['id'] ?? result?['requestId'];
      GlobalSnackBar.showSuccess(
        id == null ? l10n.deletionRequested : l10n.deletionRequestedWithId(id),
      );
    } else {
      GlobalSnackBar.showError(provider.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final provider = context.watch<AuthAccountProvider>();

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
        title: Text(l10n.privacy),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          Text(
            l10n.privacyRequestsDesc,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
          SizedBox(height: 16.h),
          PrimaryButton(
            text: l10n.downloadYourData,
            isLoading: provider.isLoading,
            onPressed: () => _requestExport(context),
          ),
          SizedBox(height: 12.h),
          PrimaryButton(
            text: l10n.requestAccountDeletion,
            isLoading: provider.isLoading,
            onPressed: () => _requestDelete(context),
          ),
        ],
      ),
    );
  }
}
