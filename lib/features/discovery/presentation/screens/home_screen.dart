import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/discovery/presentation/screens/categories_screen.dart';
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
import 'package:loni_africa/features/discovery/presentation/controllers/discovery_controller.dart';
import 'package:loni_africa/features/discovery/data/services/discovery_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book_item.dart';
import 'package:loni_africa/features/discovery/domain/models/genre.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String path = '/app/home';
  static const String name = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final DiscoveryController _discovery;
  List<BookItem> _trendingBooks = const [];
  List<Genre> _genres = const [];
  List<BookItem> _newReleases = const [];

  @override
  void initState() {
    super.initState();
    _discovery = DiscoveryController(DiscoveryService());
    _loadData();
  }

  Future<void> _loadData() async {
    final trending = await _discovery.trending();
    final genres = await _discovery.genres();
    final releases = await _discovery.newReleases();
    if (!mounted) return;
    setState(() {
      _trendingBooks = trending;
      _genres = genres;
      _newReleases = releases;
    });
  }

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
                    subtitle: context.l10n.goodEvening,
                    showBackButton: false,
                    trailingWidget: ThemeToggleButton(
                      onToggle: themeNotifier.onToggle,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  LoniSearchBar(
                    hintText: context.l10n.searchBooksAuthors,
                    readOnly: true,
                    onTap: () {
                      context.push('/app/explore/search');
                    },
                  ),
                  SizedBox(height: 22.h),
                  SectionHeader(title: context.l10n.continueReading),
                  SizedBox(height: 14.h),
                  ContinueReadingCard(
                    title: 'Things Fall Apart',
                    author: 'Chinua Achebe',
                    progress: 0.65,
                    onTap: () {},
                  ),
                  SizedBox(height: 24.h),
                  SectionHeader(
                    title: context.l10n.trendingNow,
                    actionLabel: context.l10n.seeAll,
                    onAction: () {},
                  ),
                  SizedBox(height: 14.h),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _trendingBooks.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 12.w),
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
                  SectionHeader(
                    title: context.l10n.browseByGenre,
                    actionLabel: context.l10n.seeAll,
                    onAction: () {
                      context.push('/app/explore/categories');
                    },
                  ),
                  SizedBox(height: 14.h),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: _genres
                        .map(
                          (g) => GenreCard(
                            title: g.title,
                            countLabel: g.countLabel,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 24.h),
                  SectionHeader(
                    title: context.l10n.newReleases,
                    actionLabel: context.l10n.seeAll,
                    onAction: () {},
                  ),
                  SizedBox(height: 14.h),
                  ..._newReleases.map(
                    (release) => Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: NewReleaseTile(
                        title: release.title,
                        author: release.author,
                        priceLabel: release.priceLabel ?? '',
                        formatLabel: 'Digital',
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
