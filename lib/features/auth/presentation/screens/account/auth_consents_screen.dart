import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utilities/localization_extension.dart';
import '../../../../../core/utilities/json_map.dart';
import '../../../../../shared/widgets/global_snackbar.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../provider/auth_account_provider.dart';

class AuthConsentsScreen extends StatefulWidget {
  const AuthConsentsScreen({super.key});

  static const String name = 'auth-consents';
  static const String path = '/auth/consents';

  @override
  State<AuthConsentsScreen> createState() => _AuthConsentsScreenState();
}

class _AuthConsentsScreenState extends State<AuthConsentsScreen> {
  bool _marketingEmail = false;
  bool _marketingSms = false;
  bool _personalization = false;

  bool _initializedFromRemote = false;

  void _applyFromMap(JsonMap consents) {
    _marketingEmail = consents['marketingEmail'] == true;
    _marketingSms = consents['marketingSms'] == true;
    _personalization = consents['personalization'] == true;
  }

  void _maybeInitializeFromRemote(JsonMap? consents) {
    if (_initializedFromRemote) return;
    if (consents == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _initializedFromRemote) return;
      setState(() {
        _applyFromMap(consents);
        _initializedFromRemote = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthAccountProvider>().loadConsents();
    });
  }

  Future<void> _save(AuthAccountProvider provider) async {
    final payload = <String, dynamic>{
      'marketingEmail': _marketingEmail,
      'marketingSms': _marketingSms,
      'personalization': _personalization,
    };

    await provider.saveConsents(payload);

    if (!mounted) return;
    if (provider.errorMessage == null) {
      GlobalSnackBar.showSuccess(context.l10n.changesSaved);
    } else {
      GlobalSnackBar.showError(provider.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final provider = context.watch<AuthAccountProvider>();

    _maybeInitializeFromRemote(provider.consents);

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
        title: Text(l10n.authConsents),
        actions: [
          IconButton(
            onPressed: provider.isLoading
                ? null
                : () => context.read<AuthAccountProvider>().loadConsents(),
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedRefresh,
              color: colorScheme.onSurface,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: provider.isLoading && provider.consents == null
          ? Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            )
          : ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                SwitchListTile(
                  value: _marketingEmail,
                  onChanged: (value) {
                    setState(() {
                      _marketingEmail = value;
                    });
                  },
                  title: Text(l10n.consentMarketingEmail),
                ),
                SwitchListTile(
                  value: _marketingSms,
                  onChanged: (value) {
                    setState(() {
                      _marketingSms = value;
                    });
                  },
                  title: Text(l10n.consentMarketingSms),
                ),
                SwitchListTile(
                  value: _personalization,
                  onChanged: (value) {
                    setState(() {
                      _personalization = value;
                    });
                  },
                  title: Text(l10n.consentPersonalization),
                ),
                SizedBox(height: 24.h),
                PrimaryButton(
                  text: l10n.save,
                  isLoading: provider.isLoading,
                  onPressed: () => _save(context.read<AuthAccountProvider>()),
                ),
                if (provider.errorMessage != null) ...[
                  SizedBox(height: 12.h),
                  Text(
                    provider.errorMessage!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}
