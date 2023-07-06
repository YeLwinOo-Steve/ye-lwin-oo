import 'package:intl/intl.dart';

extension DateTimeEx on DateTime{
  String toMonthAndYear(){
    final DateFormat monthFormat = DateFormat('MMMM');
    final DateFormat yearFormat = DateFormat.y();
    return "${monthFormat.format(this).toUpperCase()} ${yearFormat.format(this)}";
  }
}