import 'package:employee_assignment/pages/add_edit_employee_details/add_edit_employee_exports.dart';

DateTime stringToDateTime(String formattedString) {
  final parts = formattedString.split(' ');
  final day = int.parse(parts[0]);

  final monthIndex = months.indexOf(parts[1]);
  final year = int.parse(parts[2]);

  final parsedDateTime = DateTime(year, monthIndex + 1, day);

  return parsedDateTime;
}

String dateTimeToString(DateTime? dateTime) {
  return DateFormat('d MMM y').format(dateTime ?? DateTime.now());
}
