import 'package:flutter/widgets.dart';

import 'localization_extension.dart';

class RelativeTimeFormatter {
  const RelativeTimeFormatter._();

  static String format(BuildContext context, DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes <= 0) {
      return context.l10n.just;
    }

    if (difference.inHours <= 0) {
      return context.l10n.minutesAgo(difference.inMinutes);
    }

    if (difference.inDays <= 0) {
      return context.l10n.hoursAgo(difference.inHours);
    }

    if (difference.inDays < 7) {
      return context.l10n.daysAgoShort(difference.inDays);
    }

    final weeks = (difference.inDays / 7).floor();
    return context.l10n.weeksAgoShort(weeks);
  }
}
