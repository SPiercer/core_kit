import 'package:flutter/widgets.dart';

class VersionBanner extends StatelessWidget {
  final Widget child;

  /// Banner Location on the app, see [BannerLocation] for possible values.
  ///
  /// Has a default value of BannerLocation.topEnd
  final BannerLocation location;

  /// Text Style to be applied in the Banner
  ///
  /// Has a default value of a white bold text
  final TextStyle textStyle;

  /// Banner message
  final String text;

  /// Banner color
  ///
  /// Has a default value of Red
  final Color color;

  /// Visibility of the banner
  final bool visible;

  /// List of package extensions to hide or show
  ///
  /// Checks if the package name has a string in the array, eg.:
  ///   `com.vanethos.example.dev` with array `["dev"]`
  ///
  /// This property is overriden by [visible]. If [visible] is false,
  /// the banner will not be shown.

  const VersionBanner({
    Key? key,
    required this.child,
    required this.text,
    this.location = BannerLocation.topEnd,
    this.textStyle = const TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontWeight: FontWeight.bold,
    ),
    this.color = const Color.fromARGB(255, 255, 0, 0),
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (visible) {
      /// If we don't use the default text or search the package names, then
      /// we return the banner with the user's input
      if (text.isEmpty) {
        throw 'Text attribute should be defined';
      }

      return Directionality(
        textDirection: TextDirection.rtl,
        child: Banner(
          color: color,
          message: text,
          location: location,
          textStyle: textStyle,
          child: child,
        ),
      );
    }

    /// The banner is not visible, return the child instead
    return child;
  }
}
