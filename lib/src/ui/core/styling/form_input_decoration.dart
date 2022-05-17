import 'package:flutter/material.dart';

class FormInputDecoration = InputDecoration with _FormInputDecoration;

mixin _FormInputDecoration on InputDecoration {
  @override
  bool get filled => true;

  @override
  Color get fillColor => Colors.grey.shade50;

  @override
  EdgeInsetsGeometry get contentPadding {
    return const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 6,
    );
  }

  @override
  TextStyle get hintStyle => const TextStyle(height: 1.4);

  @override
  InputBorder get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      );

  @override
  InputBorder get enabledBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      );

  @override
  InputBorder get focusedBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      );
}
