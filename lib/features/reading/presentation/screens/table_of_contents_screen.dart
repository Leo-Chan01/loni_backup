import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/chapter_model.dart';
import 'package:loni_africa/features/reading/presentation/widgets/chapter_list_item.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

class TableOfContentsScreen extends StatefulWidget {
  final String bookId;

  const TableOfContentsScreen({super.key, required this.bookId});

  static const String path = '/table-of-contents/:bookId';
  static const String name = 'TableOfContentsScreen';

  @override
  State<TableOfContentsScreen> createState() => _TableOfContentsScreenState();
}

class _TableOfContentsScreenState extends State<TableOfContentsScreen> {
  // Mock data
  late final List<ChapterModel> _chapters;

  @override
  void initState() {
    super.initState();
    _chapters = [
      const ChapterModel(
        id: '1',
        number: 1,
        title: 'Chapter One',
        pageCount: 14,
        isCurrentChapter: true,
        progress: 0.42,
      ),
      const ChapterModel(
        id: '2',
        number: 2,
        title: 'Chapter Two',
        pageCount: 12,
      ),
      const ChapterModel(
        id: '3',
        number: 3,
        title: 'Chapter Three',
        pageCount: 10,
      ),
      const ChapterModel(
        id: '4',
        number: 4,
        title: 'Chapter Four',
        pageCount: 8,
      ),
      const ChapterModel(
        id: '5',
        number: 5,
        title: 'Chapter Five',
        pageCount: 11,
      ),
      const ChapterModel(
        id: '6',
        number: 6,
        title: 'Chapter Six',
        pageCount: 9,
      ),
      const ChapterModel(
        id: '7',
        number: 7,
        title: 'Chapter Seven',
        pageCount: 13,
      ),
    ];
  }

  void _handleChapterTap(ChapterModel chapter) {
    context.push('/reader/${widget.bookId}?chapter=${chapter.id}');
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
                        title: context.l10n.contents,
                        subtitle: '',
                        showBackButton: true,
                        onBackPressed: () => context.pop(),
                        trailingWidget: Text(
                          context.l10n.chapters(_chapters.length),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: _chapters.length,
                    itemBuilder: (context, index) {
                      final chapter = _chapters[index];
                      return ChapterListItem(
                        chapter: chapter,
                        onTap: () => _handleChapterTap(chapter),
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
