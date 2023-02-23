import 'package:intl/intl.dart';

String convertTimeToString(DateTime dateTime) {
  final localDateTime = dateTime.toLocal();
  return DateFormat('dd MMM yyyy hh:mm a').format(localDateTime);
}

String convertShortTimeToString(DateTime dateTime) {
  final localDateTime = dateTime.toLocal();
  return DateFormat('dd MMM yyyy').format(localDateTime);
}

bool compareDate(DateTime dueDate, DateTime now) {
  return dueDate.compareTo(now) > 0;
}
