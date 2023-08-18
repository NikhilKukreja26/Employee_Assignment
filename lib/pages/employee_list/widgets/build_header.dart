import 'package:employee_assignment/resources/color_manager.dart';
import 'package:employee_assignment/resources/fonts_manager.dart';
import 'package:employee_assignment/resources/values_manager.dart';
import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p14),
      color: ColorManager.header,
      child: Text(
        value,
        style: TextStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.medium,
        ),
      ),
    );
  }
}
