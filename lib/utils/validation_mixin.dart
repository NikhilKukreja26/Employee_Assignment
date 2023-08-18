import 'package:employee_assignment/helpers/regex_helper.dart';
import 'package:employee_assignment/pages/employee_list/employee_list_exports.dart';

mixin ValidationMixin {
  String? validateEmployeeName(String? value) {
    final bool isNameValid = RegExp(namePattern).hasMatch(value!);
    if (value.trim().isEmpty) {
      return AppStrings.pleaseEnterEmployeeName;
    } else if (!isNameValid) {
      return AppStrings.employeeNameNotContainSpecialCharacters;
    } else {
      return null;
    }
  }

  String? validateEmployeeRole(String? value) {
    if (value?.trim() == null || value!.trim().isEmpty) {
      return AppStrings.pleaseSelectEmployeeRole;
    } else {
      return null;
    }
  }

  String? validateEmployeeStartDate(String? value) {
    if (value?.trim() == null || value!.trim().isEmpty) {
      return AppStrings.pleaseSelectEmployeeStartDate;
    } else {
      return null;
    }
  }
}
