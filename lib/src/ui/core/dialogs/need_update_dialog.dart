import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core_kit.dart';

class NeedUpdateDialog extends StatelessWidget {
  const NeedUpdateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? Function(String) translate = KitLocalization.of(context)!.translate;

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AlertDialog(
        title: Text(
          translate(
            LocalKeys.userExp.error,
          )!,
        ),
        content: Text(
          translate(
            LocalKeys.userExp.pleaseUpdateApp,
          )!,
        ),
        actions: [
          TextButton(
            child: Text(
              translate(
                LocalKeys.userExp.update,
              )!,
            ),
            onPressed: () async {
              final packageInfo = await PackageInfo.fromPlatform();
              final String packageName = packageInfo.packageName;

              final appleAppID = await const MethodChannel('turbo_core_kit')
                  .invokeMethod<String>('getAppleAppID');

              Platform.isAndroid
                  ? launch(
                      "https://play.google.com/store/apps/details?id=$packageName")
                  : launch(
                      "https://apps.apple.com/eg/app/turbo-eg/id$appleAppID");
            },
          )
        ],
      ),
    );
  }
}
