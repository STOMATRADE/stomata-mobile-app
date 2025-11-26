import 'package:intl/intl.dart';

class Helpers {
  static String formatRupiah(int number) {
    final formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(number);
  }
}
