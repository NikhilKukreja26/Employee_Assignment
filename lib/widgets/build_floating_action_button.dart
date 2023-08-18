import 'package:flutter/material.dart';

class BuildFloatingActionButton extends StatelessWidget {
  const BuildFloatingActionButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    if (screenWidth < 500) {
      return FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
      );
    }
    return FloatingActionButton.large(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
