/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsAnimationGen {
  const $AssetsAnimationGen();

  /// File path: assets/animation/error.json
  String get error => 'assets/animation/error.json';

  /// File path: assets/animation/payment_success_animation.json
  String get paymentSuccessAnimation => 'assets/animation/payment_success_animation.json';

  /// File path: assets/animation/splash.json
  String get splash => 'assets/animation/splash.json';
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/chat.svg
  SvgGenImage get chat => const SvgGenImage('assets/icons/chat.svg');

  /// File path: assets/icons/head_phone.svg
  SvgGenImage get headPhone => const SvgGenImage('assets/icons/head_phone.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/honor_bagde_icon.svg
  SvgGenImage get honorBagdeIcon => const SvgGenImage('assets/icons/honor_bagde_icon.svg');

  /// File path: assets/icons/login_icon.svg
  SvgGenImage get loginIcon => const SvgGenImage('assets/icons/login_icon.svg');

  /// File path: assets/icons/message-circle.svg
  SvgGenImage get messageCircle => const SvgGenImage('assets/icons/message-circle.svg');

  /// File path: assets/icons/mission.svg
  SvgGenImage get mission => const SvgGenImage('assets/icons/mission.svg');

  /// File path: assets/icons/notification.svg
  SvgGenImage get notification => const SvgGenImage('assets/icons/notification.svg');

  /// File path: assets/icons/package.svg
  SvgGenImage get package => const SvgGenImage('assets/icons/package.svg');

  /// File path: assets/icons/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/icons/phone.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/send.svg
  SvgGenImage get send => const SvgGenImage('assets/icons/send.svg');

  /// File path: assets/icons/setting.svg
  SvgGenImage get setting => const SvgGenImage('assets/icons/setting.svg');

  /// File path: assets/icons/timer_icon.svg
  SvgGenImage get timerIcon => const SvgGenImage('assets/icons/timer_icon.svg');

  /// File path: assets/icons/user.svg
  SvgGenImage get user => const SvgGenImage('assets/icons/user.svg');

  /// File path: assets/icons/whatsapp.svg
  SvgGenImage get whatsapp => const SvgGenImage('assets/icons/whatsapp.svg');
}

class Assets {
  Assets._();

  static const $AssetsAnimationGen animation = $AssetsAnimationGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName, package: 'core_kit');

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String package = 'core_kit',
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
