import 'package:intl/intl.dart';

String formatPrice(double price) {
  var formatedNumberPattern = NumberFormat('##,###,###,###,###.0#', 'en_US');
  return formatedNumberPattern.format(price);
}

String formatCurrency(String currencyName) {
  var formattedCurrency = NumberFormat.simpleCurrency(
    name: currencyName,
  ).currencySymbol;
  return formattedCurrency;
}

String formatDate(String? dateTime) {
  if (dateTime == null || dateTime.isEmpty) {
    return 'Not available';
  }
  try {
    DateFormat formatter = DateFormat('EEEE, M/d/y');
    String formattedDate = formatter.format(DateTime.parse(dateTime));
    return formattedDate;
  } catch (e) {
    return 'Invalid date';
  }
}
