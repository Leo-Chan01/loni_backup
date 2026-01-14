import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/presentation/provider/highlights_notes_provider.dart';
import 'package:loni_africa/features/reading/presentation/widgets/highlight_entry_card.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

class HighlightsNotesScreen extends StatefulWidget {
  final String bookId;

  const HighlightsNotesScreen({super.key, required this.bookId});

  static const String path = '/highlights-notes/:bookId';
  static const String name = 'HighlightsNotesScreen';

  @override
  State<HighlightsNotesScreen> createState() => _HighlightsNotesScreenState();
}

class _HighlightsNotesScreenState extends State<HighlightsNotesScreen> {
  int _selectedFilterIndex = 0;

  void _setFilter(HighlightsNotesProvider provider, int index) {
    setState(() => _selectedFilterIndex = index);

    switch (index) {
      case 0:
        provider.setFilter(HighlightsFilter.all);
        break;
      case 1:
        provider.setFilter(HighlightsFilter.highlights);
        break;
      case 2:
        provider.setFilter(HighlightsFilter.notes);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider(
      create: (_) => HighlightsNotesProvider(bookId: widget.bookId),
      child: Builder(
        builder: (context) {
          final provider = context.watch<HighlightsNotesProvider>();

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
                        child: Column(
                          children: [
                            ScreenHeader(
                              title: context.l10n.highlightsAndNotes,
                              subtitle: '',
                              showBackButton: true,
                              onBackPressed: () => context.pop(),
                              trailingWidget: Text(
                                context.l10n.items(provider.totalCount),
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _FilterChip(
                                    label: context.l10n.all,
                                    isSelected: _selectedFilterIndex == 0,
                                    onTap: () => _setFilter(provider, 0),
                                  ),
                                  SizedBox(width: 8.w),
                                  _FilterChip(
                                    label: context.l10n.highlights,
                                    isSelected: _selectedFilterIndex == 1,
                                    onTap: () => _setFilter(provider, 1),
                                  ),
                                  SizedBox(width: 8.w),
                                  _FilterChip(
                                    label: context.l10n.notes,
                                    isSelected: _selectedFilterIndex == 2,
                                    onTap: () => _setFilter(provider, 2),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.h),
                          ],
                        ),
                      ),
                      Expanded(
                        child: provider.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: colorScheme.primary,
                                ),
                              )
                            : provider.error != null
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.all(24.w),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        context.l10n.error,
                                        style: textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        provider.error!,
                                        style: textTheme.bodyMedium,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 16.h),
                                      TextButton(
                                        onPressed: provider.retry,
                                        child: Text(context.l10n.retry),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                itemCount: provider.items.length,
                                itemBuilder: (context, index) {
                                  final highlight = provider.items[index];
                                  return HighlightEntryCard(
                                    highlight: highlight,
                                    onTap: () {},
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: isSelected ? Colors.white : colorScheme.onSurface,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
