import 'package:flutter/material.dart';

import 'form_input_decoration.dart';

class AddOrderInputDecorator extends StatelessWidget {
  const AddOrderInputDecorator({
    Key? key,
    required this.value,
    required this.label,
    this.requiredValue = false,
  }) : super(key: key);

  final String value;
  final String label;
  final bool requiredValue;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      isEmpty: value.isEmpty,
      decoration: FormInputDecoration(
        label: Text.rich(
          TextSpan(
            text: label,
            children: [
              if (requiredValue) ...[
                const TextSpan(
                  text: '  *',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              ]
            ],
          ),
        ),
        suffixIcon: const Icon(
          Icons.keyboard_arrow_left,
        ),
      ),
      child: Text(
        value ,
        style: const TextStyle(height: 1.4),
      ),
    );
  }
}
