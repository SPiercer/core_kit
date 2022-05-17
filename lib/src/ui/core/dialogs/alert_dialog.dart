import 'package:flutter/material.dart';
import '../buttons/cancel_button.dart';
import '../buttons/continue_button.dart';

showAlertDialog({
  required BuildContext context,
  bool? isDanger,
  String? title,
  String? continueTitle,
  Function? continueFunction,
  String? cancelTitle,
  Function? cancelFunction,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => CustomAlertDialog(
      title: title,
      continueTitle: continueTitle,
      cancelTitle: cancelTitle,
      isDanger: isDanger,
      continueFunction: continueFunction,
      cancelFunction: cancelFunction,
    ),
  );
}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    this.title,
    this.continueTitle,
    this.cancelTitle,
    this.isDanger,
    this.continueFunction,
    this.cancelFunction,
  }) : super(key: key);
  final String? title;
  final String? continueTitle;
  final String? cancelTitle;
  final bool? isDanger;
  final Function? continueFunction;
  final Function? cancelFunction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title!,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: ContinueButton(
                    isDanger: isDanger,
                    continueTitle: continueTitle,
                    continueFunction: continueFunction as void Function()?,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: CancelButton(
                    isDanger: isDanger,
                    cancelTitle: cancelTitle,
                    cancelFunction: cancelFunction as void Function()?,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
