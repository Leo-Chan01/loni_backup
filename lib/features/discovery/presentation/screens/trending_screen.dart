import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/discovery/data/services/discovery_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book_item.dart';
import 'package:loni_africa/features/discovery/presentation/controllers/discovery_controller.dart';
import 'package:loni_africa/shared/widgets/filter_chip_row.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';
import 'package:loni_africa/shared/widgets/trending_book_item.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  static const String path = 'trending';
  static const String name = 'TrendingScreen';

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  late final DiscoveryController _discovery;
  List<BookItem> _trendingBooks = const [];
  int _selectedCountryIndex = 0;

  final _trendChanges = [
    '+2 from last week',
    'No change',
    '+5 from last week',
    '-1 from last week',
    '+3 from last week',
  ];

  final _countryEmojis = ['🇳🇬', '🇰🇪', '🇿🇦', '🇬🇭'];

  @override
  void initState() {
    super.initState();
    _discovery = DiscoveryController(DiscoveryService());
    _loadTrending();
  }

  Future<void> _loadTrending() async {
    final trending = await _discovery.trending();
    if (!mounted) return;
    setState(() {
      _trendingBooks = trending.take(5).toList();
    });
  }

  List<String> _getCountries(BuildContext context) => [
    context.l10n.nigeria,
    context.l10n.kenya,
    context.l10n.southAfrica,
    context.l10n.ghana,
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final countries = _getCountries(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowLeft01,
                          color: colorScheme.onSurface,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          context.l10n.trending,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: colorScheme.outline.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedGlobe,
                            color: colorScheme.onSurface,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: FilterChipRow(
                    labels: countries,
                    selectedIndex: _selectedCountryIndex,
                    onSelected: (index) {
                      setState(() {
                        _selectedCountryIndex = index;
                      });
                    },
                    emojis: _countryEmojis,
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.topBooksThisWeek(
                            countries[_selectedCountryIndex],
                          ),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                        SizedBox(height: 16.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _trendingBooks.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 12.h),
                          itemBuilder: (context, index) {
                            final book = _trendingBooks[index];
                            return TrendingBookItem(
                              rank: index + 1,
                              title: book.title,
                              author: book.author,
                              price: book.priceLabel ?? '\$9.99',
                              imageUrl:
                                  'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=300',
                              trendChange: _trendChanges[index],
                              onTap: () {},
                            );
                          },
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
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
