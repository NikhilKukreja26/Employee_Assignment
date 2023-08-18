import 'package:employee_assignment/resources/fonts_manager.dart';
import 'package:employee_assignment/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class NoEmployeeEmptyState extends StatelessWidget {
  const NoEmployeeEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFF2F2F2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset('assets/images/no_employee.svg'),
          ),
          Text(
            AppStrings.noEmployeeRecords,
            style: TextStyle(
              fontSize: FontSize.s18,
              fontWeight: FontWeightManager.medium,
            ),
          ),
        ],
      ),
    );
  }
}
