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

void setAttendStatus(Function(String) onStatusSet) {
  var dateNow = DateTime.now();
  var hour = int.parse(DateFormat('HH').format(dateNow));
  var minute = int.parse(DateFormat('MM').format(dateNow));

  String attendanceStatus;

  if (hour < 7 || (hour == 7 && minute == 00 )) {
    attendanceStatus = "Attend";
  } else if (hour > 7 || (hour == 7 && minute >= 01)) {
    attendanceStatus = "Late";
  } else {
    attendanceStatus = "Absent";
  }

  onStatusSet(attendanceStatus);
}