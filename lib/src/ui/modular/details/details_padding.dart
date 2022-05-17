import 'package:flutter/material.dart';

class DetailsPadding extends StatelessWidget {
  const DetailsPadding({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      child: child,
    );
  }
}
