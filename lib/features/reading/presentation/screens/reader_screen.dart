import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';

import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/reader_settings_model.dart';
import 'package:loni_africa/features/reading/presentation/provider/reader_provider.dart';
import 'package:loni_africa/features/reading/presentation/widgets/reader_bottom_controls.dart';
import 'package:loni_africa/features/reading/presentation/widgets/reader_progress_bar.dart';
import 'package:loni_africa/features/reading/presentation/widgets/reader_sessions_summary.dart';
import 'package:loni_africa/shared/widgets/global_snackbar.dart';

class ReaderScreen extends StatelessWidget {
  final String bookId;

  const ReaderScreen({super.key, required this.bookId});

  static const String path = '/reader/:bookId';
  static const String name = 'ReaderScreen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ReaderProvider(bookId: bookId),
      child: const _ReaderView(),
    );
  }
}

class _ReaderView extends StatefulWidget {
  const _ReaderView();

  @override
  State<_ReaderView> createState() => _ReaderViewState();
}

class _ReaderViewState extends State<_ReaderView> {
  final ReaderSettingsModel _settings = const ReaderSettingsModel();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_scrollController.hasClients) return;
    final provider = context.read<ReaderProvider>();
    final offset = _scrollController.offset;
    final maxOffset = _scrollController.position.maxScrollExtent;
    if (maxOffset > 0) {
      final progress = (offset / maxOffset).clamp(0.0, 1.0);
      provider.updateProgress(progress);
    }
  }

  Color get _backgroundColor {
    switch (_settings.theme) {
      case ReaderTheme.dark:
        return const Color(0xFF0B0B0C);
      case ReaderTheme.light:
        return Theme.of(context).colorScheme.surface;
      case ReaderTheme.sepia:
        return const Color(0xFFF4ECD8);
    }
  }

  Color get _textColor {
    switch (_settings.theme) {
      case ReaderTheme.dark:
        return const Color(0xFFA1A1AA);
      case ReaderTheme.light:
        return Theme.of(context).colorScheme.onSurface;
      case ReaderTheme.sepia:
        return const Color(0xFF3E3E3E);
    }
  }

  void _handleContents(BuildContext context, String bookId) {
    context.push('/table-of-contents/$bookId');
  }

  void _handleBookmark() {}

  Future<void> _handleHighlight() async {
    final provider = context.read<ReaderProvider>();

    try {
      await provider.createQuickHighlight();
      if (!mounted) return;
      GlobalSnackBar.showSuccess(context.l10n.success);
    } catch (_) {
      if (!mounted) return;
      GlobalSnackBar.showError(context.l10n.error);
    }
  }

  void _handleSettings(BuildContext context, String bookId) {
    context.push('/reader-settings/$bookId');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDark = _settings.theme == ReaderTheme.dark;
    final provider = context.watch<ReaderProvider>();

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF161618).withValues(alpha: 0.95)
                    : Theme.of(
                        context,
                      ).colorScheme.surface.withValues(alpha: 0.95),
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowLeft01,
                      color: _textColor,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ReaderProgressBar(progress: provider.progress),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    '${(provider.progress * 100).toInt()}%',
                    style: textTheme.bodySmall?.copyWith(
                      color: _textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            if (!provider.isLoading && provider.error == null)
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 0),
                child: ReaderSessionsSummary(
                  isLoading: provider.isReadingSessionsLoading,
                  error: provider.readingSessionsError,
                  sessionsCount: provider.readingSessionsCount,
                  totalDuration: provider.totalReadingDuration,
                  textColor: _textColor,
                ),
              ),

            Expanded(
              child: provider.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  : provider.error != null
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.all(24.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HugeIcon(
                              icon: HugeIcons.strokeRoundedAlert02,
                              color: Theme.of(context).colorScheme.error,
                              size: 48.sp,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              context.l10n.error,
                              style: textTheme.titleMedium?.copyWith(
                                color: _textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              provider.error!,
                              style: textTheme.bodyMedium?.copyWith(
                                color: _textColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 24.h),
                            TextButton.icon(
                              onPressed: provider.retry,
                              icon: HugeIcon(
                                icon: HugeIcons.strokeRoundedRefresh,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              label: Text(
                                context.l10n.retry,
                                style: TextStyle(color: _textColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      controller: _scrollController,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 32.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: provider.paragraphs
                            .map(
                              (paragraph) => Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: Text(
                                  paragraph,
                                  style: TextStyle(
                                    color: _textColor,
                                    fontFamily:
                                        _settings.fontFamily == ReaderFont.serif
                                        ? 'Merriweather'
                                        : null,
                                    fontSize: _settings.fontSize.sp,
                                    height: _settings.lineSpacing,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
            ),

            ReaderBottomControls(
              onContentsPressed: () =>
                  _handleContents(context, provider.bookId),
              onBookmarkPressed: _handleBookmark,
              onHighlightPressed: _handleHighlight,
              onSettingsPressed: () =>
                  _handleSettings(context, provider.bookId),
              isDark: isDark,
            ),
          ],
        ),
      ),
    );
  }
}
