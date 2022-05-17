import 'package:flutter/material.dart';

import 'details_padding.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return DetailsPadding(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              value != null ? value.toString() : '-',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
