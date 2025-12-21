import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/presentation/widgets/preview_banner.dart';
import 'package:loni_africa/features/reading/presentation/widgets/preview_end_notice.dart';

class BookPreviewScreen extends StatefulWidget {
  final String bookId;

  const BookPreviewScreen({super.key, required this.bookId});

  static const String path = '/book-preview/:bookId';
  static const String name = 'BookPreviewScreen';

  @override
  State<BookPreviewScreen> createState() => _BookPreviewScreenState();
}

class _BookPreviewScreenState extends State<BookPreviewScreen> {
  // Mock data
  final String _bookTitle = 'Things Fall Apart';
  final String _chapterTitle = 'Chapter 1';
  final int _totalPages = 209;
  final String _price = '\$9.99';

  final List<String> _previewContent = const [
    'Okonkwo was well known throughout the nine villages and even beyond. His fame rested on solid personal achievements. As a young man of eighteen he had brought honor to his village by throwing Amalinze the Cat. Amalinze was the great wrestler who for seven years was unbeaten, from Umuofia to Mbaino.',
    'He was called the Cat because his back would never touch the earth. It was this man that Okonkwo threw in a fight which the old men agreed was one of the fiercest since the founder of their town engaged a spirit of the wild for seven days and seven nights.',
    'The drums beat and the flutes sang and the spectators held their breath. Amalinze was a wily craftsman, but Okonkwo was as slippery as a fish in water. Every nerve and every muscle stood out on their arms, on their backs and their thighs, and one almost heard them stretching to breaking point.',
    'In the end Okonkwo threw the Cat. That was many years ago, twenty years or more, and during this time Okonkwo\'s fame had grown like a bush-fire in the harmattan.',
  ];

  Future<void> _handleBuyBook() async {
    // Implement purchase logic
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Preview Banner
            PreviewBanner(onBuyPressed: _handleBuyBook),

            // Reader Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: colorScheme.surface.withValues(alpha: 0.95),
                border: Border(
                  bottom: BorderSide(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                  ),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Icon(
                      Icons.close,
                      color: colorScheme.onSurface,
                      size: 24.sp,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          _bookTitle,
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                            fontFamily: 'Merriweather',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '$_chapterTitle • ${context.l10n.preview}',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: colorScheme.onSurface,
                    size: 24.sp,
                  ),
                ],
              ),
            ),

            // Reading Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Chapter Title
                    Text(
                      'Chapter One',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                        fontFamily: 'Merriweather',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.h),

                    // Preview Content
                    ..._previewContent.map(
                      (paragraph) => Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Text(
                          paragraph,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontFamily: 'Merriweather',
                            height: 1.8,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // Preview End Notice
                    PreviewEndNotice(
                      totalPages: _totalPages,
                      price: _price,
                      onBuyPressed: _handleBuyBook,
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
