import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

enum NotificationType {
  generic,
  follow,
  like,
  comment,
  reply,
  mention,
  newBook,
  discussion,
  achievement,
  sale,
  orderShipped,
  paymentConfirmed,
}

extension NotificationTypeExtension on NotificationType {
  dynamic get icon {
    switch (this) {
      case NotificationType.generic:
        return HugeIcons.strokeRoundedNotification01;
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
      case NotificationType.orderShipped:
        return HugeIcons.strokeRoundedPackage;
      case NotificationType.paymentConfirmed:
        return HugeIcons.strokeRoundedCreditCardValidation;
    }
  }

  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case NotificationType.generic:
        return colorScheme.primary;
      case NotificationType.follow:
        return colorScheme.primary;
      case NotificationType.like:
        return colorScheme.error;
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
        return colorScheme.tertiary;
      case NotificationType.sale:
        return colorScheme.tertiary;
      case NotificationType.orderShipped:
        return colorScheme.primary;
      case NotificationType.paymentConfirmed:
        return colorScheme.primary;
    }
  }
}

class AppNotification {
  final String id;
  final NotificationType type;
  final String title;
  final String body;
  final Map<String, dynamic> data;
  final bool isRead;
  final DateTime createdAt;

  const AppNotification({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    this.data = const <String, dynamic>{},
    this.isRead = false,
    required this.createdAt,
  });
}
