import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/offline_book_model.dart';
import 'package:loni_africa/features/reading/domain/models/storage_model.dart';
import 'package:loni_africa/features/reading/presentation/widgets/downloaded_book_item.dart';
import 'package:loni_africa/features/reading/presentation/widgets/storage_overview_card.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

class OfflineManagerScreen extends StatefulWidget {
  const OfflineManagerScreen({super.key});

  static const String path = '/offline-manager';
  static const String name = 'OfflineManagerScreen';

  @override
  State<OfflineManagerScreen> createState() => _OfflineManagerScreenState();
}

class _OfflineManagerScreenState extends State<OfflineManagerScreen> {
  // Mock data
  final StorageModel _storage = const StorageModel(
    usedGB: 2.4,
    totalGB: 5.0,
    booksCount: 8,
  );

  late List<OfflineBookModel> _downloadedBooks;

  @override
  void initState() {
    super.initState();
    _downloadedBooks = [
      const OfflineBookModel(
        bookId: '1',
        title: 'Things Fall Apart',
        author: 'Chinua Achebe',
        coverImageUrl:
            'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=200&auto=format&fit=crop',
        status: DownloadStatus.downloaded,
        fileSize: '42.8 MB',
      ),
      const OfflineBookModel(
        bookId: '2',
        title: 'Half of a Yellow Sun',
        author: 'Chimamanda Adichie',
        coverImageUrl:
            'https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=200&auto=format&fit=crop',
        status: DownloadStatus.downloaded,
        fileSize: '58.2 MB',
      ),
      const OfflineBookModel(
        bookId: '3',
        title: 'Americanah',
        author: 'Chimamanda Adichie',
        coverImageUrl:
            'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?q=80&w=200&auto=format&fit=crop',
        status: DownloadStatus.downloading,
        downloadProgress: 0.65,
        fileSize: '62.1 MB',
      ),
      const OfflineBookModel(
        bookId: '4',
        title: 'The Famished Road',
        author: 'Ben Okri',
        coverImageUrl:
            'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?q=80&w=200&auto=format&fit=crop',
        status: DownloadStatus.downloaded,
        fileSize: '51.4 MB',
      ),
      const OfflineBookModel(
        bookId: '5',
        title: 'Purple Hibiscus',
        author: 'Chimamanda Adichie',
        coverImageUrl:
            'https://images.unsplash.com/photo-1589998059171-988d887df646?q=80&w=200&auto=format&fit=crop',
        status: DownloadStatus.downloaded,
        fileSize: '38.6 MB',
      ),
    ];
  }

  void _handleManageStorage() {
    // Implement storage management
  }

  void _handleDeleteBook(OfflineBookModel book) {
    // Implement delete logic
    setState(() {
      _downloadedBooks.removeWhere((b) => b.bookId == book.bookId);
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
                        title: context.l10n.offlineStorage,
                        subtitle: '',
                        showBackButton: true,
                        onBackPressed: () => context.pop(),
                      ),
                      SizedBox(height: 24.h),

                      // Storage Overview
                      StorageOverviewCard(
                        storage: _storage,
                        onManage: _handleManageStorage,
                      ),

                      SizedBox(height: 24.h),

                      // Downloaded Books Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.l10n.downloadedBooks,
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            context.l10n.booksLowercase(
                              _downloadedBooks.length,
                            ),
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),

                // Downloaded Books List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: _downloadedBooks.length,
                    itemBuilder: (context, index) {
                      final book = _downloadedBooks[index];
                      return DownloadedBookItem(
                        book: book,
                        onDelete: () => _handleDeleteBook(book),
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
