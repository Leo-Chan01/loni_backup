extension FormatNumber on num {
  String formatNumber({int decimalPlaces = 2}) {
    String numberString = toStringAsFixed(decimalPlaces);
    String formattedNumber = '';
    int count = 0;
    int decimalIndex = numberString.indexOf('.');

    for (int i = decimalIndex - 1; i >= 0; i--) {
      formattedNumber = numberString[i] + formattedNumber;
      count++;
      if (count % 3 == 0 && i != 0) {
        formattedNumber = ',$formattedNumber';
      }
    }

    if (this % 1 == 0) {
      return formattedNumber;
    }

    formattedNumber += numberString.substring(decimalIndex);
    return formattedNumber;
  }
}

extension CutNumber on String {
  String cutNumberTo99() {
    int number = int.tryParse(this) ?? 0;
    if (number > 99) {
      return '99';
    }
    return toString();
  }
}

extension DateFormatter on DateTime {
  String toDDMMYYYY() {
    String day = this.day.toString().padLeft(2, '0');
    String month = this.month.toString().padLeft(2, '0');
    String year = this.year.toString();
    return '$day/$month/$year';
  }
}

extension DateAndTimeFormatter on DateTime {
  String toDDMMYYYYWithTime() {
    String day = this.day.toString().padLeft(2, '0');
    String month = this.month.toString().padLeft(2, '0');
    String year = this.year.toString();
    String hour = this.hour.toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    return '$day/$month/$year at $hour:$minute';
  }
}

extension DateAndTimeFormatterFor12Hour on DateTime {
  String toDDMMYYYYWith12HTime() {
    String day = this.day.toString().padLeft(2, '0');
    String month = this.month.toString().padLeft(2, '0');
    String year = this.year.toString();
    String hour =
        (this.hour % 12 == 0 ? 12 : this.hour % 12).toString().padLeft(2, '0');
    String minute = this.minute.toString().padLeft(2, '0');
    String period = this.hour >= 12 ? 'PM' : 'AM';
    return '$day/$month/$year at $hour:$minute $period';
  }
}

extension DateAndTimeFormatterForDaysAgo on DateTime {
  String toDDMMYYYYWithDaysAgo() {
    DateTime now = DateTime.now();
    Duration difference = now.difference(this);
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else {
      int numberOfDaysAgo = difference.inDays;
      return '$numberOfDaysAgo Days Ago';
    }
  }
}
