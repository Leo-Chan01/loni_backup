import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utilities/localization_extension.dart';
import '../../../../../shared/widgets/confirm_dialog.dart';
import '../../../../../shared/widgets/global_snackbar.dart';
import '../../../../../shared/widgets/state_message_view.dart';
import '../../provider/auth_account_provider.dart';

class AuthSessionsScreen extends StatefulWidget {
  const AuthSessionsScreen({super.key});

  static const String name = 'auth-sessions';
  static const String path = '/auth/sessions';

  @override
  State<AuthSessionsScreen> createState() => _AuthSessionsScreenState();
}

class _AuthSessionsScreenState extends State<AuthSessionsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthAccountProvider>().loadSessions();
    });
  }

  String _labelForSession(Map<String, dynamic> session) {
    final deviceName = session['deviceName'] ?? session['device']?['name'];
    final platform = session['platform'] ?? session['device']?['platform'];

    final parts = <String>[];
    if (deviceName != null && deviceName.toString().isNotEmpty) {
      parts.add(deviceName.toString());
    }
    if (platform != null && platform.toString().isNotEmpty) {
      parts.add(platform.toString());
    }

    if (parts.isNotEmpty) return parts.join(' • ');

    final id = session['id'];
    if (id != null) return id.toString();

    return session.toString();
  }

  Future<void> _revoke(AuthAccountProvider provider, String id) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => ConfirmDialog(
        title: l10n.revokeSessionTitle,
        message: l10n.revokeSessionMessage,
        confirmText: l10n.revoke,
        cancelText: l10n.cancel,
        isDestructive: true,
      ),
    );

    if (confirmed != true) return;

    await provider.revokeSession(id);

    if (!mounted) return;
    if (provider.errorMessage == null) {
      GlobalSnackBar.showSuccess(l10n.sessionRevoked);
    } else {
      GlobalSnackBar.showError(provider.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final provider = context.watch<AuthAccountProvider>();

    final sessions = provider.sessions;

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
        title: Text(l10n.activeSessions),
        actions: [
          IconButton(
            onPressed: provider.isLoading
                ? null
                : () => context.read<AuthAccountProvider>().loadSessions(),
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedRefresh,
              color: colorScheme.onSurface,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: provider.isLoading && sessions.isEmpty
          ? Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            )
          : sessions.isEmpty
          ? Center(
              child: StateMessageView(
                title: l10n.noActiveSessions,
                message: l10n.noActiveSessionsDesc,
                actionText: l10n.refresh,
                onAction: () => context.read<AuthAccountProvider>().loadSessions(),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(20.w),
              itemCount: sessions.length,
              separatorBuilder: (_, _) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                final session = sessions[index];
                final id = session['id']?.toString();

                return Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.2),
                    ),
                  ),
                  child: ListTile(
                    title: Text(_labelForSession(session)),
                    subtitle: id == null ? null : Text(id),
                    trailing: id == null
                        ? null
                        : TextButton(
                            onPressed: provider.isLoading
                                ? null
                                : () => _revoke(
                                      context.read<AuthAccountProvider>(),
                                      id,
                                    ),
                            child: Text(
                              l10n.revoke,
                              style: TextStyle(color: colorScheme.error),
                            ),
                          ),
                  ),
                );
              },
            ),
    );
  }
}
