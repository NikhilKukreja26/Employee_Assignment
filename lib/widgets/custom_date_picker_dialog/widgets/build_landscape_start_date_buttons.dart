import 'package:employee_assignment/resources/strings_manager.dart';
import 'package:employee_assignment/resources/values_manager.dart';
import 'package:flutter/material.dart';

class BuildLandscapeStartDateButtons extends StatelessWidget {
  const BuildLandscapeStartDateButtons({
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
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: onTodayPressed,
              child: const Text(AppStrings.today),
            ),
          ),
          SizedBox(width: AppWidth.w6),
          Expanded(
            child: ElevatedButton(
              onPressed: onNextMondayPressed,
              child: const Text(AppStrings.nextMonday),
            ),
          ),
          SizedBox(width: AppWidth.w6),
          Expanded(
            child: TextButton(
              onPressed: onNextTuesdayPressed,
              child: const Text(AppStrings.nextTuesday),
            ),
          ),
          SizedBox(width: AppWidth.w6),
          Expanded(
            child: TextButton(
              onPressed: onAfter1WeekPressed,
              child: const Text(AppStrings.after1Week),
            ),
          ),
        ],
      ),
    );
  }
}
