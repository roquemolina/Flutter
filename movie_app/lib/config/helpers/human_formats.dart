import 'package:intl/intl.dart';

class HumanFormats {
//static no need to call the intance HumanFormats to use this method
  static String humanReadableNumber(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(number);
    return formatterNumber;
  }
}
