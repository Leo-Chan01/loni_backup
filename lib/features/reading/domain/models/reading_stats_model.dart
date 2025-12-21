class ReadingStatsModel {
  final int pagesReadThisWeek;
  final String readingTimeThisWeek;
  final int currentStreak;
  final int booksFinishedThisWeek;
  final Map<String, double> dailyActivity;
  final double weeklyGoalHours;
  final double weeklyProgressHours;

  const ReadingStatsModel({
    required this.pagesReadThisWeek,
    required this.readingTimeThisWeek,
    required this.currentStreak,
    required this.booksFinishedThisWeek,
    required this.dailyActivity,
    required this.weeklyGoalHours,
    required this.weeklyProgressHours,
  });

  double get weeklyGoalPercent {
    return (weeklyProgressHours / weeklyGoalHours * 100).clamp(0, 100);
  }

  String get hoursLeftToGoal {
    final left = (weeklyGoalHours - weeklyProgressHours).clamp(
      0,
      weeklyGoalHours,
    );
    return left.toStringAsFixed(1);
  }

  ReadingStatsModel copyWith({
    int? pagesReadThisWeek,
    String? readingTimeThisWeek,
    int? currentStreak,
    int? booksFinishedThisWeek,
    Map<String, double>? dailyActivity,
    double? weeklyGoalHours,
    double? weeklyProgressHours,
  }) {
    return ReadingStatsModel(
      pagesReadThisWeek: pagesReadThisWeek ?? this.pagesReadThisWeek,
      readingTimeThisWeek: readingTimeThisWeek ?? this.readingTimeThisWeek,
      currentStreak: currentStreak ?? this.currentStreak,
      booksFinishedThisWeek:
          booksFinishedThisWeek ?? this.booksFinishedThisWeek,
      dailyActivity: dailyActivity ?? this.dailyActivity,
      weeklyGoalHours: weeklyGoalHours ?? this.weeklyGoalHours,
      weeklyProgressHours: weeklyProgressHours ?? this.weeklyProgressHours,
    );
  }
}
