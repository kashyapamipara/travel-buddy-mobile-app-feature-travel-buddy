import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_buddy/constants/color_constants.dart';
import 'package:travel_buddy/constants/extensions.dart';

import '../../constants/text_styles.dart';

class AuthTextField extends StatelessWidget {
  final Widget? suffixWidget;
  final String hintText;
  final FocusNode focusNode;
  final ValueChanged onSubmitted;
  final int maxLines;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String type;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final bool isEnabled;
  final bool isPasswordVisible;

  const AuthTextField({
    super.key,
    this.suffixWidget,
    this.inputFormatters,
    required this.hintText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.type,
    required this.focusNode,
    required this.onSubmitted,
    this.errorText,
    this.isEnabled = true,
    this.isPasswordVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyles.h6.semiBold.copyWith(
        color: Colors.black.withOpacity(0.5),
      ),
      cursorColor: ColorConstants.primary,
      enabled: isEnabled,
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
      obscureText:
          type == "password" ? (isPasswordVisible ? false : true) : false,
      decoration: InputDecoration(
        errorText: errorText,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12.0,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            width: 1.0,
            color: ColorConstants.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: ColorConstants.primary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            width: 2.0,
            color: ColorConstants.lightRed,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            width: 1.0,
            color: ColorConstants.lightRed,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(
              end: 12.0, top: 12.0, bottom: 12.0),
          child: suffixWidget,
        ),
        hintText: hintText,
        hintStyle: TextStyles.h6.semiBold.copyWith(
          color: ColorConstants.grey.withOpacity(0.5),
        ),
        fillColor: Colors.white,
      ),
      maxLines: maxLines,
    );
  }
}
