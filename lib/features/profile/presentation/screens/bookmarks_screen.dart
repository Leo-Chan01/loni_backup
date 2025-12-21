import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utilities/localization_extension.dart';
import '../../../profile/domain/models/bookmark_model.dart';
import '../widgets/bookmark_card.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  static const String path = '/bookmarks';
  static const String name = 'BookmarksScreen';

  @override
  Widget build(BuildContext context) {
    final List<Bookmark> mockBookmarks = [
      Bookmark(
        id: '1',
        bookId: '1',
        bookTitle: 'Things Fall Apart',
        bookAuthor: 'Chinua Achebe',
        quoteText:
            'The world has no end, and what is good among one people is an abomination with others.',
        chapterNumber: 7,
        pageNumber: 142,
        savedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Bookmark(
        id: '2',
        bookId: '2',
        bookTitle: 'Half of a Yellow Sun',
        bookAuthor: 'Chimamanda Ngozi Adichie',
        quoteText:
            'The real tragedy of our postcolonial world is not that the majority of people had no say in whether or not they wanted this new world; rather, it is that the majority have not been given the tools to negotiate this new world.',
        chapterNumber: 12,
        pageNumber: 287,
        savedAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Bookmark(
        id: '3',
        bookId: '3',
        bookTitle: 'Americanah',
        bookAuthor: 'Chimamanda Ngozi Adichie',
        quoteText:
            'The only reason you say that race was not an issue is because you wish it was not. But it is a lie.',
        chapterNumber: 15,
        pageNumber: 359,
        savedAt: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01),
          onPressed: () => context.pop(),
        ),
        title: Text(context.l10n.savedQuotes),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(24.w),
        itemCount: mockBookmarks.length,
        itemBuilder: (context, index) {
          final bookmark = mockBookmarks[index];
          return BookmarkCard(
            bookmark: bookmark,
            onShare: () {},
            onDelete: () {},
          );
        },
      ),
    );
  }
}
