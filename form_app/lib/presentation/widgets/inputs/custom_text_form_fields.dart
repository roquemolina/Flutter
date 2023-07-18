import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      this.obscureText = false});

  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(color: colors.primary, width: 2),
    );
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
            borderSide: BorderSide(color: colors.secondary, width: 3)),
        errorBorder: border.copyWith(
            borderSide: BorderSide(color: Colors.red.shade800, width: 3)),
        focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(color: Colors.red.shade800, width: 3)),
        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        focusColor: colors.primary,
        prefixIcon:
            Icon(Icons.supervised_user_circle_outlined, color: colors.primary),
        errorText: errorMessage,
      ),
    );
  }
}
