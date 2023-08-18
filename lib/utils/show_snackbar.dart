import 'package:employee_assignment/resources/strings_manager.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        ScaffoldMessenger,
        SnackBar,
        SnackBarAction,
        Text,
        VoidCallback;

void showSnackbar({
  required BuildContext context,
  required String text,
  required VoidCallback onPressed,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: AppStrings.undo,
        onPressed: onPressed,
      ),
    ),
  );
}
