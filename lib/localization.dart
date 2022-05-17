library localizations;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class KitLocalization {
  final Locale locale;

  KitLocalization(this.locale);

  static KitLocalization? of(BuildContext context) =>
      Localizations.of(context, KitLocalization);

  static const LocalizationsDelegate<KitLocalization> delegate =
      _KitLocalizationDelegate();
      
  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    final jsonString =
        await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    _localizedStrings = jsonMap.map((k, v) => MapEntry(k, v.toString()));
    return true;
  }

  String? translate(String key) => _localizedStrings[key];
}

class _KitLocalizationDelegate extends LocalizationsDelegate<KitLocalization> {
  const _KitLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

  @override
  Future<KitLocalization> load(Locale locale) async {
    final localizations = KitLocalization(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<KitLocalization> old) =>
      false;
}


