import 'package:intl/intl.dart';

void setDateTime(Function(String, String, String) onDateTimeSet) {
  var dateNow = DateTime.now();
  var dataFormat = DateFormat('dd-MM-yyyy');
  var dateTime = DateFormat('HH:mm:ss');

  String date = dataFormat.format(dateNow);
  String time = dateTime.format(dateNow);
  String currentDate = '$date | $time';

  onDateTimeSet(date, time, currentDate);
}