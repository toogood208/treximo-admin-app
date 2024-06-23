import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.sufficeIcon,
    this.preficeIcon,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final Widget? sufficeIcon;
  final Widget? preficeIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: preficeIcon,
        hintText: hintText,
        suffixIcon: sufficeIcon,
      ),
    );
  }
}