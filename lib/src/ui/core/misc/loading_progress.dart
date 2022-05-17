import 'package:flutter/material.dart';
import 'package:core_kit/src/utils/conditional_builder.dart';

class LoadingProgress extends StatelessWidget {
  final Widget child;
  final bool show;

  const LoadingProgress({
    Key? key,
    required this.show,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: show,
      builder: (context) => Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.shade50,
        child: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
      fallback: (context) => child,
    );
  }
}
