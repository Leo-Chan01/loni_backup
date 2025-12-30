import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/presentation/widgets/year_challenge_card.dart';
import 'package:loni_africa/features/reading/presentation/widgets/monthly_stats_grid.dart';
import 'package:loni_africa/features/reading/presentation/widgets/genre_progress_bar.dart';
import 'package:loni_africa/features/reading/presentation/widgets/finished_book_item.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';

class ReadingStatsScreen extends StatefulWidget {
  static const String path = '/reading-stats';
  static const String name = 'ReadingStatsScreen';

  const ReadingStatsScreen({super.key});

  @override
  State<ReadingStatsScreen> createState() => _ReadingStatsScreenState();
}

class _ReadingStatsScreenState extends State<ReadingStatsScreen> {
  // Mock data
  final int _currentYear = 2024;
  final int _booksRead = 32;
  final int _goalBooks = 40;
  final int _booksFinished = 4;
  final int _pagesRead = 842;
  final double _hoursRead = 18.5;
  final int _dayStreak = 28;

  final List<Map<String, dynamic>> _genreStats = [
    {'genre': 'Fiction', 'percentage': 45.0, 'color': Color(0xFFB85C38)},
    {'genre': 'History', 'percentage': 28.0, 'color': Color(0xFFC46A3A)},
    {'genre': 'Biography', 'percentage': 18.0, 'color': Color(0xFF9E4A2F)},
    {'genre': 'Poetry', 'percentage': 9.0, 'color': Colors.grey},
  ];

  final List<Map<String, dynamic>> _recentBooks = [
    {
      'title': 'Things Fall Apart',
      'author': 'Chinua Achebe',
      'coverUrl':
          'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=200&auto=format&fit=crop',
      'daysAgo': 2,
      'rating': 5.0,
    },
    {
      'title': 'Half of a Yellow Sun',
      'author': 'Chimamanda Adichie',
      'coverUrl':
          'https://images.unsplash.com/photo-1512820790803-83ca734da794?q=80&w=200&auto=format&fit=crop',
      'daysAgo': 5,
      'rating': 4.8,
    },
  ];

  void _handleShare() {
    // Implement share functionality
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final booksAhead = _booksRead - (_goalBooks * 0.5).toInt();
    final progress = _booksRead / _goalBooks;
    final booksRemaining = _goalBooks - _booksRead;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ScreenHeader(
                title: context.l10n.yourReadingStats,
                subtitle: '',
                showBackButton: true,
                onBackPressed: () => context.pop(),
                trailingWidget: IconButton(
                  onPressed: _handleShare,
                  icon: Icon(Icons.share, color: colorScheme.onSurfaceVariant),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    YearChallengeCard(
                      year: _currentYear,
                      booksRead: _booksRead,
                      booksAhead: booksAhead,
                      progress: progress,
                      booksRemaining: booksRemaining,
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      context.l10n.thisMonth,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    MonthlyStatsGrid(
                      booksFinished: _booksFinished,
                      pagesRead: _pagesRead,
                      hoursRead: _hoursRead,
                      streak: _dayStreak,
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      context.l10n.favoriteGenres,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        border: Border.all(
                          color: colorScheme.outline.withValues(alpha: 0.2),
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        children: List.generate(
                          _genreStats.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(
                              bottom: index < _genreStats.length - 1 ? 16.h : 0,
                            ),
                            child: GenreProgressBar(
                              genre: _genreStats[index]['genre'],
                              percentage: _genreStats[index]['percentage'],
                              color: _genreStats[index]['color'],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      context.l10n.recentlyFinished,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Column(
                      children: List.generate(
                        _recentBooks.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            bottom: index < _recentBooks.length - 1 ? 12.h : 0,
                          ),
                          child: FinishedBookItem(
                            coverUrl: _recentBooks[index]['coverUrl'],
                            title: _recentBooks[index]['title'],
                            author: _recentBooks[index]['author'],
                            daysAgo: _recentBooks[index]['daysAgo'],
                            rating: _recentBooks[index]['rating'],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
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
