import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
    this.isDanger = false,
    this.continueTitle,
    this.continueFunction,
  }) : super(key: key);
  final bool? isDanger;
  final String? continueTitle;
  final VoidCallback? continueFunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15.0),
          onPrimary: Theme.of(context).primaryColor),
      child: Text(
        continueTitle!,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () => continueFunction!(),
    );
  }
}
