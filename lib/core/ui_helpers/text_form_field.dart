import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextStyle? style;
  final VoidCallback? onSuffixPressed;
  final ValueChanged<String>? onChanged; // Change to ValueChanged<String>
  final int? maxLines;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.onSuffixPressed,
    this.style,
    this.maxLines,
    this.textInputAction,
    this.labelText,
    this.onChanged, // Ensure onChanged is required and has a ValueChanged<String> type
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged, // Directly pass the onChanged callback here
      textInputAction: textInputAction,
      maxLines: maxLines,
      style: style,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixPressed,
        )
            : null,
      ),
    );
  }
}
