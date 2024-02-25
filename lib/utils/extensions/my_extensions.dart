import 'package:intl/intl.dart';

DateTime dateTime = DateTime.now();
int week = dateTime.weekday;

extension ParseToStringDate on int {
  String getParsedDate() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat.yMMMMEEEEd("en_US").format(dateTime);
  }

  String getDay() {
    DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(this * 1000);
    return DateFormat.EEEE("en_US").format(dateTime);
  }

  String getWeekdayName(int weekday) {
    if (week != 7) {
      week++;
    } else {
      week = 1;
    }
    final DateTime now = DateTime.now().toLocal();
    final int diff = now.weekday - weekday; // weekday is our 1-7 ISO value
    var udpatedDt;
    if (diff > 0) {
      udpatedDt = now.subtract(Duration(days: diff));
    } else if (diff == 0) {
      udpatedDt = now;
    } else {
      udpatedDt = now.add(Duration(days: diff * -1));
    }
    final String weekdayName = DateFormat('EEEE').format(udpatedDt);
    return weekdayName;
  }

  String getParsedDateDay() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat.E().format(dateTime);
  }

  String getParsedHour() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat(" HH:mm ").format(dateTime);
  }
}

extension ParseImageURL on String {
  String getWeatherIconUrl() {
    return "https://openweathermap.org/img/wn/$this@2x.png";
  }
}
