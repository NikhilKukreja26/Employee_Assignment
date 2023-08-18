import 'package:employee_assignment/resources/strings_manager.dart';
import 'package:employee_assignment/resources/values_manager.dart';
import 'package:flutter/material.dart';

class BuildEndDateButtons extends StatelessWidget {
  const BuildEndDateButtons({
    super.key,
    required this.onNoDatePressed,
    required this.onTodayPressed,
  });
  final VoidCallback onNoDatePressed;
  final VoidCallback onTodayPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: onNoDatePressed,
                child: const Text(AppStrings.noDate),
              ),
            ),
            SizedBox(width: AppWidth.w20),
            Expanded(
              child: TextButton(
                onPressed: onTodayPressed,
                child: const Text(AppStrings.today),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
