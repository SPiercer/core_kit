import 'package:flutter/material.dart';
import '../styling/colors.dart';

class WaningAlertDialog extends StatelessWidget {
  const WaningAlertDialog({Key? key, 
    required this.warningTitle,
    this.warningTextStyle = const TextStyle(color: AppColors.redColor),
  }) : super(key: key);

  final TextStyle warningTextStyle;
  final String warningTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  start: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close_outlined),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: AppColors.redColor,
                        size: 50,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        warningTitle,
                        style: warningTextStyle,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
