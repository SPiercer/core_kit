import 'package:flutter/material.dart';

class DetailsDivider extends StatelessWidget {
  const DetailsDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 14
      ),
      width: double.infinity,
      height: 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade100,
      ),
    );
  }
}
