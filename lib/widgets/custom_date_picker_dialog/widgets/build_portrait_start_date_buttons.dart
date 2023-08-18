import 'package:employee_assignment/resources/strings_manager.dart';
import 'package:employee_assignment/resources/values_manager.dart';
import 'package:flutter/material.dart';

class BuildPortraitStartDateButtons extends StatelessWidget {
  const BuildPortraitStartDateButtons({
    super.key,
    required this.onTodayPressed,
    required this.onNextMondayPressed,
    required this.onNextTuesdayPressed,
    required this.onAfter1WeekPressed,
  });

  final VoidCallback onTodayPressed;
  final VoidCallback onNextMondayPressed;
  final VoidCallback onNextTuesdayPressed;
  final VoidCallback onAfter1WeekPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: onTodayPressed,
                child: const Text(AppStrings.today),
              ),
            ),
            SizedBox(width: AppWidth.w20),
            Expanded(
              child: ElevatedButton(
                onPressed: onNextMondayPressed,
                child: const Text(AppStrings.nextMonday),
              ),
            ),
          ],
        ),
        SizedBox(height: AppHeight.h15),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: onNextTuesdayPressed,
                child: const Text(AppStrings.nextTuesday),
              ),
            ),
            SizedBox(width: AppWidth.w20),
            Expanded(
              child: TextButton(
                onPressed: onAfter1WeekPressed,
                child: const Text(AppStrings.after1Week),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
