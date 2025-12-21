class StorageModel {
  final double usedGB;
  final double totalGB;
  final int booksCount;

  const StorageModel({
    required this.usedGB,
    required this.totalGB,
    required this.booksCount,
  });

  double get percentUsed {
    return (usedGB / totalGB * 100).clamp(0, 100);
  }

  double get availableGB {
    return (totalGB - usedGB).clamp(0, totalGB);
  }

  StorageModel copyWith({double? usedGB, double? totalGB, int? booksCount}) {
    return StorageModel(
      usedGB: usedGB ?? this.usedGB,
      totalGB: totalGB ?? this.totalGB,
      booksCount: booksCount ?? this.booksCount,
    );
  }
}
