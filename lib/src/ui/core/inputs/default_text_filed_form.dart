import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    Key? key,
    required this.hintTitle,
    required this.controller,
    this.focusNode,
    this.textInputType = TextInputType.text,
    this.onSubmitted,
    this.validator,
    this.maxLines = 1,
    this.inputFormatters,
    this.onSaved,
    this.prefixIcon,
    this.prefixText,
    this.isValidate = true,
    this.textDirection,
    this.enabledBorder,
    this.focusedBorder,
    this.border,
    this.contentPadding,
    this.obscureText = false,
    this.showLabel = true,
    this.textStyle,
  }) : super(key: key);

  final String hintTitle;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final TextInputType textInputType;
  final int maxLines;
  final Function(String value)? onSubmitted;
  final Function(String? value)? onSaved;
  final Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final String? prefixText;
  final bool isValidate;
  final TextDirection? textDirection;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final bool showLabel;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      onSaved: onSaved,
      maxLines: maxLines,
      textDirection: textDirection,
      decoration: InputDecoration(
        hintText: hintTitle,
        labelText: showLabel ? hintTitle : null,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
      ),
      validator: isValidate
          ? validator != null
              ? (String? value) => validator!(value)
              : (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'يجب عليك ادخال $hintTitle';
                  }
                  return null;
                }
          : null,
      onFieldSubmitted: onSubmitted,
    );
  }
}
