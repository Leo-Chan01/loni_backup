import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import '../../../../core/utilities/localization_extension.dart';
import '../../../../core/utilities/validators.dart';
import '../../../../shared/widgets/global_snackbar.dart';
import '../provider/profile_provider.dart';
import '../widgets/profile_photo_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static const String path = '/edit-profile';
  static const String name = 'EditProfileScreen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();

  bool _hasInitializedFromProfile = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final profileProvider = context.watch<ProfileProvider>();
    final profile = profileProvider.profile;

    if (profile != null && !_hasInitializedFromProfile) {
      _fullNameController.text = profile.fullName;
      _emailController.text = profile.email ?? '';
      _locationController.text = profile.location ?? '';
      _hasInitializedFromProfile = true;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01),
          onPressed: () => context.pop(),
        ),
        title: Text(context.l10n.editProfile),
        actions: [
          TextButton(
            onPressed: profileProvider.isSaving
                ? null
                : () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    final locale = Localizations.localeOf(context).languageCode;
                    final result = await context.read<ProfileProvider>().saveProfile(
                      fullName: _fullNameController.text,
                      region: _locationController.text,
                      locale: locale,
                    );

                    if (!context.mounted) return;

                    if (result.isSuccess) {
                      GlobalSnackBar.showSuccess(context.l10n.success);
                      context.pop(true);
                    } else {
                      GlobalSnackBar.showError(
                        result.message ?? context.l10n.error,
                      );
                    }
                  },
            child: Text(
              context.l10n.save,
              style: TextStyle(
                color: colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePhotoPicker(avatarUrl: profile?.avatarUrl, onTap: () {}),
              SizedBox(height: 32.h),
              Text(
                context.l10n.fullName,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  hintText: context.l10n.fullName,
                  filled: true,
                  fillColor: colorScheme.surfaceContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                ),
                validator: (value) {
                  return Validators.validateRequired(
                    context.l10n,
                    value,
                    context.l10n.fullName,
                  );
                },
              ),
              SizedBox(height: 20.h),
              Text(
                context.l10n.email,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: context.l10n.email,
                  filled: true,
                  fillColor: colorScheme.surfaceContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                enabled: false,
              ),
              SizedBox(height: 20.h),
              Text(
                context.l10n.location,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: context.l10n.location,
                  filled: true,
                  fillColor: colorScheme.surfaceContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              if (profileProvider.isLoading)
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: CircularProgressIndicator(color: colorScheme.primary),
                  ),
                ),
              if (!profileProvider.isLoading && profileProvider.errorMessage != null)
                Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Text(
                    profileProvider.errorMessage!,
                    style: TextStyle(color: colorScheme.error),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
