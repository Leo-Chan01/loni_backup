import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/reading_progress_model.dart';
import 'package:loni_africa/features/reading/presentation/widgets/current_book_progress_card.dart';
import 'package:loni_africa/features/reading/presentation/widgets/daily_activity_chart.dart';
import 'package:loni_africa/features/reading/presentation/widgets/stats_card.dart';
import 'package:loni_africa/features/reading/presentation/widgets/weekly_goal_card.dart';
import 'package:loni_africa/shared/widgets/screen_header.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

class ReadingProgressScreen extends StatefulWidget {
  final String bookId;

  const ReadingProgressScreen({super.key, required this.bookId});

  static const String path = '/reading-progress/:bookId';
  static const String name = 'ReadingProgressScreen';

  @override
  State<ReadingProgressScreen> createState() => _ReadingProgressScreenState();
}

class _ReadingProgressScreenState extends State<ReadingProgressScreen> {
  // Mock data
  final ReadingProgressModel _currentBookProgress = ReadingProgressModel(
    bookId: '1',
    currentPage: 88,
    totalPages: 209,
    progressPercent: 42,
    pagesRead: 88,
    pagesLeft: 121,
    timeLeft: '3.2h',
    lastReadAt: DateTime.now(),
  );

  final Map<String, double> _dailyActivity = {
    'Mon': 0.45,
    'Tue': 0.65,
    'Wed': 0.80,
    'Thu': 0.55,
    'Fri': 0.90,
    'Sat': 0.70,
    'Sun': 1.0,
  };

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
                  child: ScreenHeader(
                    title: context.l10n.readingProgress,
                    subtitle: '',
                    showBackButton: true,
                    onBackPressed: () => context.pop(),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),

                        // Current Book Progress
                        CurrentBookProgressCard(
                          coverImageUrl:
                              'https://images.unsplash.com/photo-1544947950-fa07a98d237f?q=80&w=800&auto=format&fit=crop',
                          title: 'Things Fall Apart',
                          author: 'Chinua Achebe',
                          progress: _currentBookProgress,
                        ),

                        SizedBox(height: 32.h),

                        // This Week Stats
                        Text(
                          context.l10n.thisWeek,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: StatsCard(
                                icon: Icons.menu_book_rounded,
                                iconColor: colorScheme.primary,
                                value: '142',
                                label: context.l10n.pagesRead,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: StatsCard(
                                icon: Icons.access_time_rounded,
                                iconColor: const Color(0xFFC46A3A),
                                value: '5.2h',
                                label: context.l10n.readingTime,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Expanded(
                              child: StatsCard(
                                icon: Icons.local_fire_department_rounded,
                                iconColor: colorScheme.primary,
                                value: '7',
                                label: context.l10n.dayStreak,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: StatsCard(
                                icon: Icons.emoji_events_rounded,
                                iconColor: const Color(0xFFC46A3A),
                                value: '3',
                                label: context.l10n.booksFinished,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 32.h),

                        // Daily Activity Chart
                        DailyActivityChart(dailyActivity: _dailyActivity),

                        SizedBox(height: 32.h),

                        // Weekly Goal
                        WeeklyGoalCard(
                          currentHours: 5.2,
                          goalHours: 7,
                          onEdit: () {
                            // Implement edit goal
                          },
                        ),

                        SizedBox(height: 32.h),
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
