import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utilities/localization_extension.dart';
import '../../../../../core/utilities/json_map.dart';
import '../../../../../shared/widgets/auth_text_field.dart';
import '../../../../../shared/widgets/global_snackbar.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../provider/auth_account_provider.dart';

class AuthParentalControlsScreen extends StatefulWidget {
  const AuthParentalControlsScreen({super.key});

  static const String name = 'auth-parental-controls';
  static const String path = '/auth/parental-controls';

  @override
  State<AuthParentalControlsScreen> createState() =>
      _AuthParentalControlsScreenState();
}

class _AuthParentalControlsScreenState extends State<AuthParentalControlsScreen> {
  final TextEditingController _pinController = TextEditingController();

  bool _enabled = false;
  String _contentRating = 'kids';
  bool _clearPin = false;

  bool _initializedFromRemote = false;

  void _applyFromMap(JsonMap parental) {
    _enabled = parental['enabled'] == true;

    final contentRating = parental['contentRating'];
    if (contentRating is String && contentRating.isNotEmpty) {
      _contentRating = contentRating;
    }
  }

  void _maybeInitializeFromRemote(JsonMap? parental) {
    if (_initializedFromRemote) return;
    if (parental == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _initializedFromRemote) return;
      setState(() {
        _applyFromMap(parental);
        _initializedFromRemote = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthAccountProvider>().loadParentalControls();
    });
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  String _ratingLabel(BuildContext context, String value) {
    final l10n = context.l10n;
    switch (value) {
      case 'teen':
        return l10n.parentalRatingTeen;
      case 'mature':
        return l10n.parentalRatingMature;
      case 'kids':
      default:
        return l10n.parentalRatingKids;
    }
  }

  Future<void> _save(AuthAccountProvider provider) async {
    final pinText = _pinController.text.trim();
    final payload = <String, dynamic>{
      'enabled': _enabled,
      'contentRating': _contentRating,
      'clearPin': _clearPin,
    };

    if (pinText.isNotEmpty) {
      payload['pin'] = pinText;
    }

    await provider.saveParentalControls(payload);

    if (!mounted) return;
    if (provider.errorMessage == null) {
      GlobalSnackBar.showSuccess(context.l10n.changesSaved);
      _pinController.clear();
      setState(() {
        _clearPin = false;
      });
    } else {
      GlobalSnackBar.showError(provider.errorMessage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final provider = context.watch<AuthAccountProvider>();

    _maybeInitializeFromRemote(provider.parentalControls);

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
        title: Text(l10n.parentalControls),
        actions: [
          IconButton(
            onPressed: provider.isLoading
                ? null
                : () => context.read<AuthAccountProvider>().loadParentalControls(),
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedRefresh,
              color: colorScheme.onSurface,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: provider.isLoading && provider.parentalControls == null
          ? Center(
              child: CircularProgressIndicator(color: colorScheme.primary),
            )
          : ListView(
              padding: EdgeInsets.all(20.w),
              children: [
                SwitchListTile(
                  value: _enabled,
                  onChanged: (value) {
                    setState(() {
                      _enabled = value;
                    });
                  },
                  title: Text(l10n.parentalControlsEnabled),
                ),
                SizedBox(height: 12.h),
                DropdownButtonFormField<String>(
                  initialValue: _contentRating,
                  decoration: InputDecoration(
                    labelText: l10n.parentalContentRating,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: colorScheme.outline.withValues(alpha: 0.3),
                      ),
                    ),
                  ),
                  items: const ['kids', 'teen', 'mature']
                      .map(
                        (value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(_ratingLabel(context, value)),
                        ),
                      )
                      .toList(growable: false),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _contentRating = value;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                AuthTextField(
                  label: l10n.parentalPin,
                  hintText: l10n.parentalPinHint,
                  controller: _pinController,
                  keyboardType: TextInputType.number,
                  isPassword: true,
                ),
                SizedBox(height: 8.h),
                SwitchListTile(
                  value: _clearPin,
                  onChanged: (value) {
                    setState(() {
                      _clearPin = value;
                    });
                  },
                  title: Text(l10n.parentalClearPin),
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
