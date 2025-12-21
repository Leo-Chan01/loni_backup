import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

enum NotificationType {
  follow,
  like,
  comment,
  reply,
  mention,
  newBook,
  discussion,
  achievement,
  sale,
}

extension NotificationTypeExtension on NotificationType {
  dynamic get icon {
    switch (this) {
      case NotificationType.follow:
        return HugeIcons.strokeRoundedUserAdd02;
      case NotificationType.like:
        return HugeIcons.strokeRoundedFavourite;
      case NotificationType.comment:
        return HugeIcons.strokeRoundedComment02;
      case NotificationType.reply:
        return HugeIcons.strokeRoundedComment02;
      case NotificationType.mention:
        return HugeIcons.strokeRoundedAt;
      case NotificationType.newBook:
        return HugeIcons.strokeRoundedBook02;
      case NotificationType.discussion:
        return HugeIcons.strokeRoundedUserMultiple;
      case NotificationType.achievement:
        return HugeIcons.strokeRoundedMedal01;
      case NotificationType.sale:
        return HugeIcons.strokeRoundedTag01;
    }
  }

  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case NotificationType.follow:
        return colorScheme.primary;
      case NotificationType.like:
        return Colors.red;
      case NotificationType.comment:
      case NotificationType.reply:
        return colorScheme.secondary;
      case NotificationType.mention:
        return colorScheme.secondary;
      case NotificationType.newBook:
        return colorScheme.primary;
      case NotificationType.discussion:
        return colorScheme.secondary;
      case NotificationType.achievement:
        return Colors.amber;
      case NotificationType.sale:
        return Colors.green;
    }
  }
}

class AppNotification {
  final String id;
  final NotificationType type;
  final String userId;
  final String userFullName;
  final String? userAvatarUrl;
  final String message;
  final String? actionLink;
  final bool isRead;
  final DateTime createdAt;

  const AppNotification({
    required this.id,
    required this.type,
    required this.userId,
    required this.userFullName,
    this.userAvatarUrl,
    required this.message,
    this.actionLink,
    this.isRead = false,
    required this.createdAt,
  });
}
