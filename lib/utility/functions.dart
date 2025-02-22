// function to convert timestamp to human readable date

import 'package:intl/intl.dart';

String getHumanReadableDate(int timestamp) {
  DateFormat dateFormat = DateFormat("dd-MMM-yyyy hh:mm a");
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return dateFormat.format(dateTime);
}