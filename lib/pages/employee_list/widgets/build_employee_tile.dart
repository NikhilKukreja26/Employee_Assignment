import 'package:employee_assignment/models/employee_model.dart';
import 'package:employee_assignment/resources/color_manager.dart';
import 'package:employee_assignment/resources/fonts_manager.dart';
import 'package:employee_assignment/resources/strings_manager.dart';
import 'package:employee_assignment/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class BuildEmployeeTile extends StatelessWidget {
  final Employee employee;
  final VoidCallback onTap;

  const BuildEmployeeTile({
    super.key,
    required this.employee,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                employee.employeeName,
                style: TextStyle(
                  color: ColorManager.lightBlack,
                  fontSize: FontSize.s16,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
              SizedBox(height: AppHeight.h6),
              Text(
                employee.employeeRole,
                style: TextStyle(
                  color: ColorManager.grey,
                  fontSize: FontSize.s14,
                ),
              ),
              SizedBox(height: AppHeight.h6),
              Visibility(
                visible: employee.endDate != null,
                replacement: Text(
                  '${AppStrings.from} ${DateFormat.yMMMd().format(employee.startDate)}',
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: FontSize.s12,
                  ),
                ),
                child: Text(
                  '${AppStrings.from} ${DateFormat.yMMMd().format(employee.startDate)} - ${DateFormat.yMMMd().format(employee.endDate ?? DateTime.now())}',
                  style: TextStyle(
                    color: ColorManager.grey,
                    fontSize: FontSize.s12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
