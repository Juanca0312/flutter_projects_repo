import 'package:intl/intl.dart';

String humanNumberFormat(double number) {
  final formatNumber = NumberFormat.compactCurrency(
    decimalDigits: 0,
    symbol: '',
    locale: 'en',
  ).format(number);

  return formatNumber;
}