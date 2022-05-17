import 'package:cherry_toast/cherry_toast_icon.dart';
import 'package:flutter/material.dart';

class Toasts {
  late String msg;
  late IconData icon;
  late Color color;
  String? _description;

  Toasts.errorToast({required this.msg}) {
    icon = Icons.warning_rounded;
    color = const Color(0xffE43837);
  }

  Toasts.successToast({required this.msg}) {
    icon = Icons.check_circle;
    color = const Color(0xFF2F9449);
  }

  Toasts.toastConnectionError() {
    icon = Icons.warning_rounded;
    color = const Color(0xffE43837);
    msg = 'حدث خطأ ما';
    _description = "تعذر الإتصال بالخادم، أعد المحاولة لاحقًا";
  }

  Toasts.toastInvalidInformation() {
    icon = Icons.warning_rounded;
    color = const Color(0xffE43837);
    msg = 'معلومات غير صحيحة';
  }

  void show(BuildContext context, {Duration duration = const Duration(seconds: 2)}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: duration,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment:
                  _description == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                CherryToatIcon(
                  color: color,
                  icon: icon,
                  iconSize: 20,
                  iconColor: color,
                  enableAnimation: true,
                ),
                Expanded(
                  child: _renderContent(),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _renderContent() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              msg,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "Din",
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          if (_description != null) ...[
            const SizedBox(height: 5),
            Flexible(
              child: Text(
                _description ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: "Din",
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
