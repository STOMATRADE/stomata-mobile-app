import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helpers {
  static String formatRupiah(int number) {
    final formatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDRX ',
      decimalDigits: 0,
    );
    return formatter.format(number);
  }

  static String formatAmount(int number) {
    final formatter = NumberFormat.decimalPattern('id');
    return formatter.format(number);
  }

  static double getFullHeight(context) {
    double screenFullHeight = MediaQuery.of(context).size.height;

    return screenFullHeight;
  }

  static double getFullWidth(context) {
    double screenFullHeight = MediaQuery.of(context).size.width;

    return screenFullHeight;
  }

  static double formatTokenAmount({
    required BigInt amount,
    required int decimals,
  }) {
    final amountDecimal = Decimal.fromBigInt(amount);
    final divisor = Decimal.parse('1${'0' * decimals}'); // 10^decimals
    final result = amountDecimal / divisor;
    return result.toDouble();
  }

  static BigInt parseTokenAmount({
    required String input,
    required int decimals,
  }) {
    final decimalValue = Decimal.parse(input);
    final multiplier = Decimal.parse('1${'0' * decimals}'); // 10^decimals
    return (decimalValue * multiplier).toBigInt();
  }

  int getDecimals() {
    return 18;
  }

  static String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(dateTime);
  }
}
