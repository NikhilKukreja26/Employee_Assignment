import 'package:employee_assignment/data/select_role_data.dart';
import 'package:employee_assignment/resources/color_manager.dart';
import 'package:employee_assignment/resources/fonts_manager.dart';
import 'package:employee_assignment/resources/values_manager.dart';
import 'package:flutter/material.dart';

class BuildShowSelectRoleBottomSheet extends StatelessWidget {
  const BuildShowSelectRoleBottomSheet({
    super.key,
    required this.onTap,
  });

  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          height: 0.5,
        );
      },
      padding: EdgeInsets.zero,
      itemCount: selectRoleData.length,
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        final role = selectRoleData[index];
        return Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppBorderRadius.r16),
            topRight: Radius.circular(AppBorderRadius.r16),
          ),
          child: InkWell(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppBorderRadius.r16),
              topRight: Radius.circular(AppBorderRadius.r16),
            ),
            onTap: () => onTap(role),
            child: BuildSelectRoleTile(
              role: role,
            ),
          ),
        );
      },
    );
  }
}

class BuildSelectRoleTile extends StatelessWidget {
  const BuildSelectRoleTile({
    super.key,
    required this.role,
  });

  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p16),
      child: Text(
        role,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ColorManager.lightBlack,
          fontSize: FontSize.s16,
        ),
      ),
    );
  }
}
