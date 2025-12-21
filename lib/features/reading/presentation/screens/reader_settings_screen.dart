import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/reader_settings_model.dart';
import 'package:loni_africa/features/reading/presentation/widgets/font_size_control.dart';
import 'package:loni_africa/features/reading/presentation/widgets/theme_selector.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

class ReaderSettingsScreen extends StatefulWidget {
  final String bookId;

  const ReaderSettingsScreen({super.key, required this.bookId});

  static const String path = '/reader-settings/:bookId';
  static const String name = 'ReaderSettingsScreen';

  @override
  State<ReaderSettingsScreen> createState() => _ReaderSettingsScreenState();
}

class _ReaderSettingsScreenState extends State<ReaderSettingsScreen> {
  ReaderSettingsModel _settings = const ReaderSettingsModel();

  void _updateSettings(ReaderSettingsModel newSettings) {
    setState(() {
      _settings = newSettings;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ScreenHeader(
                    title: context.l10n.readingSettings,
                    subtitle: '',
                    showBackButton: true,
                    onBackPressed: () => context.pop(),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),

                        // Font Size
                        Text(
                          context.l10n.fontSize,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        FontSizeControl(
                          fontSize: _settings.fontSize,
                          onChanged: (value) {
                            _updateSettings(
                              _settings.copyWith(fontSize: value),
                            );
                          },
                        ),

                        SizedBox(height: 32.h),

                        // Theme
                        Text(
                          context.l10n.readingTheme,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        ThemeSelector(
                          selectedTheme: _settings.theme,
                          onThemeChanged: (theme) {
                            _updateSettings(_settings.copyWith(theme: theme));
                          },
                        ),

                        SizedBox(height: 32.h),

                        // Font Family
                        Text(
                          context.l10n.fontFamily,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _FontFamilyOption(
                          label: 'Merriweather (${context.l10n.serif})',
                          isSelected: _settings.fontFamily == ReaderFont.serif,
                          onTap: () {
                            _updateSettings(
                              _settings.copyWith(fontFamily: ReaderFont.serif),
                            );
                          },
                          fontFamily: 'Merriweather',
                        ),
                        SizedBox(height: 12.h),
                        _FontFamilyOption(
                          label: 'Inter (${context.l10n.sansSerif})',
                          isSelected:
                              _settings.fontFamily == ReaderFont.sansSerif,
                          onTap: () {
                            _updateSettings(
                              _settings.copyWith(
                                fontFamily: ReaderFont.sansSerif,
                              ),
                            );
                          },
                          fontFamily: null,
                        ),

                        SizedBox(height: 32.h),

                        // Line Spacing
                        Text(
                          context.l10n.lineSpacing,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            border: Border.all(
                              color: colorScheme.outline.withValues(alpha: 0.2),
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context.l10n.compact,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  Text(
                                    context.l10n.relaxed,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                  trackHeight: 4.h,
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 8.r,
                                  ),
                                  overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 16.r,
                                  ),
                                ),
                                child: Slider(
                                  value: _settings.lineSpacing,
                                  min: 1.4,
                                  max: 2.2,
                                  divisions: 4,
                                  activeColor: colorScheme.primary,
                                  inactiveColor:
                                      colorScheme.surfaceContainerHighest,
                                  onChanged: (value) {
                                    _updateSettings(
                                      _settings.copyWith(lineSpacing: value),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // Auto-scroll
                        Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            border: Border.all(
                              color: colorScheme.outline.withValues(alpha: 0.2),
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          padding: EdgeInsets.all(20.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.l10n.autoScroll,
                                      style: textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: colorScheme.onSurface,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      context.l10n.automaticallyScrollPages,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Switch(
                                value: _settings.autoScroll,
                                activeThumbColor: colorScheme.primary,
                                onChanged: (value) {
                                  _updateSettings(
                                    _settings.copyWith(autoScroll: value),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FontFamilyOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final String? fontFamily;

  const _FontFamilyOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? colorScheme.primary
                : colorScheme.outline.withValues(alpha: 0.2),
            width: isSelected ? 2.w : 1.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontFamily: fontFamily,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check, color: colorScheme.primary, size: 20.sp),
          ],
        ),
      ),
    );
  }
}
