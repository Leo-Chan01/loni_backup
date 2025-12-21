import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/highlight_model.dart';
import 'package:loni_africa/features/reading/presentation/widgets/highlight_card.dart';
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

  // Mock data
  late final List<HighlightModel> _allHighlights;
  late List<HighlightModel> _filteredHighlights;

  @override
  void initState() {
    super.initState();
    _allHighlights = [
      HighlightModel(
        id: '1',
        bookId: widget.bookId,
        type: HighlightType.highlight,
        chapterTitle: 'Chapter 1',
        pageNumber: 12,
        text:
            'Okonkwo was well known throughout the nine villages and even beyond. His fame rested on solid personal achievements.',
        note:
            'This introduction perfectly captures the essence of Okonkwo\'s character and sets the tone for the entire story.',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      HighlightModel(
        id: '2',
        bookId: widget.bookId,
        type: HighlightType.highlight,
        chapterTitle: 'Chapter 3',
        pageNumber: 28,
        text:
            'He had no patience with unsuccessful men. He had had no patience with his father.',
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      HighlightModel(
        id: '3',
        bookId: widget.bookId,
        type: HighlightType.bookmark,
        chapterTitle: 'Chapter 5',
        pageNumber: 42,
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ];
    _filteredHighlights = _allHighlights;
  }

  void _filterHighlights(int index) {
    setState(() {
      _selectedFilterIndex = index;

      switch (index) {
        case 0: // All
          _filteredHighlights = _allHighlights;
          break;
        case 1: // Highlights
          _filteredHighlights = _allHighlights
              .where((h) => h.type == HighlightType.highlight)
              .toList();
          break;
        case 2: // Notes
          _filteredHighlights = _allHighlights
              .where((h) => h.type == HighlightType.note)
              .toList();
          break;
        case 3: // Bookmarks
          _filteredHighlights = _allHighlights
              .where((h) => h.type == HighlightType.bookmark)
              .toList();
          break;
      }
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
                  child: Column(
                    children: [
                      ScreenHeader(
                        title: context.l10n.highlightsAndNotes,
                        subtitle: '',
                        showBackButton: true,
                        onBackPressed: () => context.pop(),
                        trailingWidget: Text(
                          context.l10n.items(_allHighlights.length),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Filter Tabs
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _FilterChip(
                              label: context.l10n.all,
                              isSelected: _selectedFilterIndex == 0,
                              onTap: () => _filterHighlights(0),
                            ),
                            SizedBox(width: 8.w),
                            _FilterChip(
                              label: context.l10n.highlights,
                              isSelected: _selectedFilterIndex == 1,
                              onTap: () => _filterHighlights(1),
                            ),
                            SizedBox(width: 8.w),
                            _FilterChip(
                              label: context.l10n.notes,
                              isSelected: _selectedFilterIndex == 2,
                              onTap: () => _filterHighlights(2),
                            ),
                            SizedBox(width: 8.w),
                            _FilterChip(
                              label: context.l10n.bookmarks,
                              isSelected: _selectedFilterIndex == 3,
                              onTap: () => _filterHighlights(3),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),

                // Highlights List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: _filteredHighlights.length,
                    itemBuilder: (context, index) {
                      final highlight = _filteredHighlights[index];
                      return HighlightCard(
                        highlight: highlight,
                        onShare: () {
                          // Implement share
                        },
                        onDelete: () {
                          // Implement delete
                        },
                        onTap: () {
                          // Navigate to reader at this location
                        },
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
