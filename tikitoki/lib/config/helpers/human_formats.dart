import 'package:intl/intl.dart';

class HumanFormats {
//static  no need to call the intance HumanFormats to use this method
  static String humanReadableNumber(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
    return formatterNumber;
  }
}
