import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    Key? key,
    this.isDanger,
    this.cancelTitle,
    this.cancelFunction,
  }) : super(key: key);

  final bool? isDanger;
  final String? cancelTitle;
  final VoidCallback? cancelFunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        onPrimary: Theme.of(context).primaryColor.withOpacity(.1),
      ),
      child: Text(
        cancelTitle!,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        if (cancelFunction != null) {
          cancelFunction!();
        }
      },
    );
  }
}
