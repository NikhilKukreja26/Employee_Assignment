import 'package:employee_assignment/resources/color_manager.dart';
import 'package:employee_assignment/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShowBackground extends StatelessWidget {
  const ShowBackground({
    super.key,
    required this.direction,
  });

  final int direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p14),
      color: ColorManager.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Icon(
        MdiIcons.trashCanOutline,
        size: AppHeight.h24,
        color: ColorManager.white,
      ),
    );
  }
}
