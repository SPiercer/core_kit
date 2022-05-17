import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class ArsLoadingDialog {
  late ArsProgressDialog progressDialog;
  final BuildContext context;

  ArsLoadingDialog(this.context) {
    progressDialog = ArsProgressDialog(context, dismissAble: kDebugMode, blur: 5);
  }

  void show() => progressDialog.show();

  void hide() => progressDialog.dismiss();
}

class ArsProgressDialog {
  final BuildContext context;
  final Widget? loadingWidget;
  final VoidCallback? onCancel;
  final bool? dismissAble;
  final VoidCallback? onDismiss;
  final double blur;
  final Color? backgroundColor;
  final bool useSafeArea;

  bool _isShowing = false;
  _ArsProgressDialogWidget? _progressDialogWidget;

  bool get isShowing => _isShowing;

  ArsProgressDialog(
    this.context, {
    this.backgroundColor,
    this.blur = 0,
    this.onCancel,
    this.dismissAble,
    this.onDismiss,
    this.loadingWidget,
    this.useSafeArea = false,
  }) {
    _initProgress();
  }

  void _initProgress() {
    _progressDialogWidget = _ArsProgressDialogWidget(
      blur: blur,
      onCancel: onCancel,
      dismissAble: dismissAble,
      backgroundColor: backgroundColor,
      onDismiss: onDismiss,
      loadingWidget: loadingWidget,
    );
  }

  // Show progress dialog
  void show() async {
    if (!_isShowing) {
      _isShowing = true;
      if (_progressDialogWidget == null) _initProgress();
      await showDialog(
        useSafeArea: useSafeArea,
        context: context,
        barrierDismissible: dismissAble ?? true,
        builder: (context) => _progressDialogWidget!,
        barrierColor: Colors.transparent,
      );
      _isShowing = false;
    }
  }

  // Dismiss progress dialog
  void dismiss() {
    if (_isShowing) {
      _isShowing = false;
      Navigator.pop(context);
    }
  }
}

// ignore: must_be_immutable
class _ArsProgressDialogWidget extends StatelessWidget {
  final VoidCallback? onCancel;
  Widget? loadingWidget;
  final VoidCallback? onDismiss;
  final double? blur;
  final Color? backgroundColor;
  final bool? dismissAble;

  _ArsProgressDialogWidget({
    this.onCancel,
    this.dismissAble,
    this.onDismiss,
    this.backgroundColor,
    this.loadingWidget,
    this.blur,
  }) {
    loadingWidget = loadingWidget ??
        const Center(
          child: CircularProgressIndicator(
            strokeWidth: 5,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return _DialogBackground(
      blur: blur,
      dismissAble: dismissAble ?? true,
      onDismiss: onDismiss,
      color: backgroundColor,
      dialog: Center(
        child: loadingWidget,
      ),
    );
  }
}

// ignore: must_be_immutable
class _DialogBackground extends StatelessWidget {
  // Widget of dialog, you can use NDialog, Dialog, AlertDialog or Custom your own Dialog
  final Widget? dialog;

  // Because blur dialog cover the barrier, you have to declare here
  final bool? dismissAble;

  // Action before dialog dismissed
  final VoidCallback? onDismiss;

  // Creates an background filter that applies a Gaussian blur.
  // Default = 0
  final double? blur;

  // Background color
  final Color? color;

  const _DialogBackground({
    this.dialog,
    this.dismissAble,
    this.blur,
    this.onDismiss,
    this.color = const Color(0x99000000),
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (dismissAble ?? true) {
          if (onDismiss != null) onDismiss!();
          Navigator.pop(context);
        }
        return false;
      },
      child: Stack(
        clipBehavior: Clip.antiAlias,
        alignment: Alignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: dismissAble ?? true
                ? () {
                    if (onDismiss != null) {
                      onDismiss!();
                    }
                    Navigator.pop(context);
                  }
                : () {},
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blur!,
                sigmaY: blur!,
              ),
              child: dialog,
            ),
          ),
        ],
      ),
    );
  }
}
