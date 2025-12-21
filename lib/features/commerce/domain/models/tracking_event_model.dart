class TrackingEvent {
  final String title;
  final String description;
  final DateTime timestamp;
  final bool isCompleted;
  final bool isActive;

  const TrackingEvent({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.isCompleted,
    this.isActive = false,
  });

  TrackingEvent copyWith({
    String? title,
    String? description,
    DateTime? timestamp,
    bool? isCompleted,
    bool? isActive,
  }) {
    return TrackingEvent(
      title: title ?? this.title,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
      isCompleted: isCompleted ?? this.isCompleted,
      isActive: isActive ?? this.isActive,
    );
  }
}
