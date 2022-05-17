import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../styles.dart';
import '../../assets/assets.gen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                (AppBar().preferredSize.height * 2),
            child: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        Assets.animation.error,
                        height: 140,
                        width: 140,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'حدث خطأ ما، تأكد من\nالإتصال بالإنترنت ثم أعد المحاولة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
