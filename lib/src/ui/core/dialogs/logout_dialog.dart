import 'package:flutter/material.dart';

class LogoutDialog extends StatefulWidget {
  final VoidCallback yesButtonPressed;

  const LogoutDialog({
    Key? key,
    required this.yesButtonPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => LogoutDialogState();
}

class LogoutDialogState extends State<LogoutDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  VoidCallback? yesButtonPressed;

  @override
  void initState() {
    super.initState();
    yesButtonPressed = widget.yesButtonPressed;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    'تسجيل الخروج',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Text(
                    'هل تريد الخروج من حسابك؟',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent),
                        onPressed: yesButtonPressed,
                        child: const Text('تسجيل الخروج'),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple.shade50,
                            shadowColor: Colors.transparent),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'إلغاء',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
