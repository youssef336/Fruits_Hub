import 'package:flutter/material.dart';
import 'package:fruits_hub_app/core/utils/text_styles.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppTextStyles.bodysmallBold.copyWith(
          color: const Color(0xFF949D9E),
        ),

        filled: true,
        fillColor: const Color(0xFFF9FAFA),

        border: bulidBoarder(),
        enabledBorder: bulidBoarder(),
        focusedBorder: bulidBoarder(),
      ),

      onChanged: (value) {
        // Handle text input changes here
      },
    );
  }

  OutlineInputBorder bulidBoarder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Color(0xFFE6E9E9), width: 1.0),
    );
  }
}
