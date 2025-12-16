import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/book_tile_vertical.dart';
import 'package:loni_africa/shared/widgets/continue_reading_card.dart';
import 'package:loni_africa/shared/widgets/genre_card.dart';
import 'package:loni_africa/shared/widgets/loni_search_bar.dart';
import 'package:loni_africa/shared/widgets/new_release_tile.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/section_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';

class BookPreview {
  const BookPreview({
    required this.title,
    required this.author,
    required this.rating,
    required this.category,
    this.badge,
  });

  final String title;
  final String author;
  final double rating;
  final String category;
  final String? badge;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String path = '/app/home';
  static const String name = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BookPreview> _trendingBooks = const [
    BookPreview(
      title: 'Half of a Yellow Sun',
      author: 'Chimamanda Adichie',
      rating: 4.8,
      category: 'Fiction',
    ),
    BookPreview(
      title: 'Americanah',
      author: 'Chimamanda Adichie',
      rating: 4.7,
      category: 'Fiction',
    ),
    BookPreview(
      title: 'The Famished Road',
      author: 'Ben Okri',
      rating: 4.5,
      category: 'Fiction',
    ),
  ];

  final List<GenreTile> _genres = const [
    GenreTile(title: 'Fiction', countLabel: '2,340 books'),
    GenreTile(title: 'History', countLabel: '1,120 books'),
    GenreTile(title: 'Poetry', countLabel: '890 books'),
    GenreTile(title: 'Children', countLabel: '1,560 books'),
  ];

  final List<NewRelease> _newReleases = const [
    NewRelease(
      title: 'The Joys of Motherhood',
      author: 'Buchi Emecheta',
      priceLabel: '\$12.99',
      formatLabel: 'Digital',
    ),
    NewRelease(
      title: 'Purple Hibiscus',
      author: 'Chimamanda Adichie',
      priceLabel: '\$14.99',
      formatLabel: 'Digital',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeNotifier = ThemeNotifier.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  ScreenHeader(
                    title: 'Kwame',
                    subtitle: 'Good evening',
                    showBackButton: false,
                    trailingWidget: ThemeToggleButton(
                      onToggle: themeNotifier.onToggle,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  LoniSearchBar(hintText: 'Search books, authors...'),
                  SizedBox(height: 22.h),
                  SectionHeader(title: 'Continue Reading'),
                  SizedBox(height: 12.h),
                  ContinueReadingCard(
                    title: 'Things Fall Apart',
                    author: 'Chinua Achebe',
                    progress: 0.65,
                    onTap: () {},
                  ),
                  SizedBox(height: 24.h),
                  SectionHeader(
                    title: 'Trending Now',
                    actionLabel: 'See All',
                    onAction: () {},
                  ),
                  SizedBox(height: 14.h),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _trendingBooks.length,
                      separatorBuilder: (_, __) => SizedBox(width: 12.w),
                      itemBuilder: (context, index) {
                        final book = _trendingBooks[index];
                        return BookTileVertical(
                          title: book.title,
                          author: book.author,
                          rating: book.rating,
                          category: book.category,
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                  SectionHeader(title: 'Browse by Genre'),
                  SizedBox(height: 14.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: _genres
                        .map(
                          (genre) => GenreCard(
                            title: genre.title,
                            countLabel: genre.countLabel,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 24.h),
                  SectionHeader(
                    title: 'New Releases',
                    actionLabel: 'See All',
                    onAction: () {},
                  ),
                  SizedBox(height: 14.h),
                  ..._newReleases.map(
                    (release) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: NewReleaseTile(
                        title: release.title,
                        author: release.author,
                        priceLabel: release.priceLabel,
                        formatLabel: release.formatLabel,
                        onTap: () {},
                        onAdd: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenreTile {
  const GenreTile({required this.title, required this.countLabel});

  final String title;
  final String countLabel;
}

class NewRelease {
  const NewRelease({
    required this.title,
    required this.author,
    required this.priceLabel,
    required this.formatLabel,
  });

  final String title;
  final String author;
  final String priceLabel;
  final String formatLabel;
}
