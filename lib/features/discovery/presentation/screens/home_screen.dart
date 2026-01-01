import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/main.dart';
import 'package:loni_africa/shared/widgets/book_tile_vertical.dart';
import 'package:loni_africa/shared/widgets/continue_reading_card.dart';
import 'package:loni_africa/shared/widgets/loni_search_bar.dart';
import 'package:loni_africa/shared/widgets/new_release_tile.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/section_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/theme_toggle_button.dart';
import 'package:loni_africa/features/discovery/presentation/controllers/discovery_controller.dart';
import 'package:loni_africa/features/discovery/data/services/discovery_api_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String path = '/app/home';
  static const String name = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final DiscoveryController _discovery;
  List<Book> _trendingBooks = [];
  List<Book> _newReleases = [];
  List<Book> _recommendations = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _discovery = DiscoveryController(DiscoveryApiService());
    _loadData();
  }

  Future<void> _loadData() async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    try {
      // Load all data in parallel
      final results = await Future.wait([
        _discovery.getBooks(sort: 'popular'),
        _discovery.getBooks(sort: 'newest'),
        _discovery.getRecommendations(),
      ]);

      if (!mounted) return;
      setState(() {
        _trendingBooks = results[0];
        _newReleases = results[1];
        _recommendations = results[2];
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
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
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: colorScheme.primary,
                    ),
                  )
                : SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        ScreenHeader(
                          title: context.l10n.home,
                          subtitle: context.l10n.welcomeBack,
                          showBackButton: false,
                          trailingWidget: ThemeToggleButton(
                            onToggle: themeNotifier.onToggle,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        LoniSearchBar(
                          onTap: () {
                            context.push('/app/explore');
                          },
                        ),
                        SizedBox(height: 24.h),
                        SectionHeader(
                          title: context.l10n.continueReading,
                        ),
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
                          onAction: () {
                            context.push('/app/explore/trending');
                          },
                        ),
                        SizedBox(height: 14.h),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.28,
                          child: _trendingBooks.isEmpty
                              ? Center(
                                  child: Text(context.l10n.noBooks),
                                )
                              : ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: _trendingBooks.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 12.w),
                                  itemBuilder: (context, index) {
                                    final book = _trendingBooks[index];
                                    return SizedBox(
                                      width: 140.w,
                                      child: BookTileVertical(
                                        title: book.title,
                                        author: book.authors.isNotEmpty
                                            ? book.authors[0].fullName
                                            : 'Unknown',
                                        rating: book.rating,
                                        category: book.categories.isNotEmpty
                                            ? book.categories[0]
                                            : 'Unknown',
                                        onTap: () {
                                          context.push(
                                            '/book-detail/${book.id}',
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                        ),
                        SizedBox(height: 32.h),
                        SectionHeader(
                          title: context.l10n.newRelease,
                          actionLabel: context.l10n.seeAll,
                          onAction: () {
                            context.push('/app/explore');
                          },
                        ),
                        SizedBox(height: 14.h),
                        _newReleases.isEmpty
                            ? Text(context.l10n.noBooks)
                            : Column(
                                children: _newReleases
                                    .take(3)
                                    .map(
                                      (book) => Padding(
                                        padding: EdgeInsets.only(bottom: 12.h),
                                        child: NewReleaseTile(
                                          title: book.title,
                                          author: book.authors.isNotEmpty
                                              ? book.authors[0].fullName
                                              : 'Unknown',
                                          priceLabel:
                                              '${(book.priceCents / 100).toStringAsFixed(2)} ${book.currency}',
                                          onTap: () {
                                            context.push(
                                              '/book-detail/${book.id}',
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                        SizedBox(height: 32.h),
                        if (_recommendations.isNotEmpty) ...[
                          SectionHeader(
                            title: context.l10n.recommendedForYou,
                          ),
                          SizedBox(height: 14.h),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 12.w,
                              mainAxisSpacing: 12.h,
                              childAspectRatio: 0.6,
                            ),
                            itemCount:
                                _recommendations.length > 6 ? 6 : _recommendations.length,
                            itemBuilder: (context, index) {
                              final book = _recommendations[index];
                              return BookTileVertical(
                                title: book.title,
                                author: book.authors.isNotEmpty
                                    ? book.authors[0].fullName
                                    : 'Unknown',
                                rating: book.rating,
                                category: book.categories.isNotEmpty
                                    ? book.categories[0]
                                    : 'Unknown',
                                onTap: () {
                                  context.push('/book-detail/${book.id}');
                                },
                              );
                            },
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
