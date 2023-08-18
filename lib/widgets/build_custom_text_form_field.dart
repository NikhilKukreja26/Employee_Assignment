import 'package:employee_assignment/resources/values_manager.dart';
import 'package:flutter/material.dart';

class BuildCustomTextFormField extends StatelessWidget {
  const BuildCustomTextFormField({
    super.key,
    this.autoCorrect = false,
    required this.controller,
    this.enabled = true,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.style,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.words,
    this.readOnly = false,
    this.validator,
    this.focusedBorder,
  });

  final bool autoCorrect;
  final TextEditingController controller;
  final bool enabled;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final TextStyle? style;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final FormFieldValidator<String?>? validator;
  final InputBorder? focusedBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: autoCorrect,
      controller: controller,
      enabled: enabled,
      onTap: onTap,
      style: style,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: focusedBorder,
        prefixIcon: Container(
          margin: EdgeInsets.symmetric(horizontal: AppMargin.m12),
          child: prefixIcon,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
