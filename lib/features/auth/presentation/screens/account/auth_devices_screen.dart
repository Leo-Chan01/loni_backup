import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utilities/localization_extension.dart';
import '../../../../../shared/widgets/confirm_dialog.dart';
import '../../../../../shared/widgets/global_snackbar.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/state_message_view.dart';
import '../../provider/auth_account_provider.dart';

class AuthDevicesScreen extends StatefulWidget {
  const AuthDevicesScreen({super.key});

  static const String name = 'auth-devices';
  static const String path = '/auth/devices';

  @override
  State<AuthDevicesScreen> createState() => _AuthDevicesScreenState();
}

class _AuthDevicesScreenState extends State<AuthDevicesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthAccountProvider>().loadDevices();
    });
  }

  String _labelForDevice(Map<String, dynamic> device) {
    final name = device['name'];
    final platform = device['platform'];
    final appVersion = device['appVersion'];

    final parts = <String>[];
    if (name != null && name.toString().isNotEmpty) parts.add(name.toString());
    if (platform != null && platform.toString().isNotEmpty) {
      parts.add(platform.toString());
    }
    if (appVersion != null && appVersion.toString().isNotEmpty) {
      parts.add(appVersion.toString());
    }

    if (parts.isNotEmpty) return parts.join(' • ');

    final id = device['id'] ?? device['deviceId'];
    if (id != null) return id.toString();

    return device.toString();
  }

  Future<void> _delete(AuthAccountProvider provider, String id) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => ConfirmDialog(
        title: l10n.deleteDeviceTitle,
        message: l10n.deleteDeviceMessage,
        confirmText: l10n.delete,
        cancelText: l10n.cancel,
        isDestructive: true,
      ),
    );

    if (confirmed != true) return;

    await provider.deleteDevice(id);

    if (!mounted) return;
    if (provider.errorMessage == null) {
      GlobalSnackBar.showSuccess(l10n.deviceDeleted);
    } else {
      GlobalSnackBar.showError(provider.errorMessage!);
    }
  }

  Future<void> _register(AuthAccountProvider provider) async {
    final l10n = context.l10n;
    await provider.registerCurrentDevice();

    if (!mounted) return;
    if (provider.errorMessage == null) {
      GlobalSnackBar.showSuccess(l10n.deviceRegistered);
    } else {
      GlobalSnackBar.showError(provider.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final provider = context.watch<AuthAccountProvider>();

    final devices = provider.devices;

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
        title: Text(l10n.devices),
        actions: [
          IconButton(
            onPressed: provider.isLoading
                ? null
                : () => context.read<AuthAccountProvider>().loadDevices(),
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedRefresh,
              color: colorScheme.onSurface,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: provider.isLoading && devices.isEmpty
          ? Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            )
          : ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                PrimaryButton(
                  text: l10n.registerThisDevice,
                  isLoading: provider.isLoading,
                  onPressed: () => _register(context.read<AuthAccountProvider>()),
                ),
                SizedBox(height: 16.h),
                if (devices.isEmpty)
                  StateMessageView(
                    title: l10n.noDevices,
                    message: l10n.noDevicesDesc,
                    actionText: l10n.refresh,
                    onAction: () => context.read<AuthAccountProvider>().loadDevices(),
                  )
                else
                  ...devices.map((device) {
                    final id = (device['id'] ?? device['deviceId'])?.toString();
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                          ),
                        ),
                        child: ListTile(
                          title: Text(_labelForDevice(device)),
                          subtitle: id == null ? null : Text(id),
                          trailing: id == null
                              ? null
                              : TextButton(
                                  onPressed: provider.isLoading
                                      ? null
                                      : () => _delete(
                                            context.read<AuthAccountProvider>(),
                                            id,
                                          ),
                                  child: Text(
                                    l10n.delete,
                                    style: TextStyle(color: colorScheme.error),
                                  ),
                                ),
                        ),
                      ),
                    );
                  }),
              ],
            ),
    );
  }
}
