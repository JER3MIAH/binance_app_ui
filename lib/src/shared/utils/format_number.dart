import 'package:intl/intl.dart';

//? Format number with commas
String formatNumber(num number) {
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}
