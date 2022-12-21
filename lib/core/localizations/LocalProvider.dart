import 'package:arabee_voice_recorder/core/dependency_injection/injection_container.dart';
import 'package:arabee_voice_recorder/core/utils/constants/constants.dart';
import 'package:arabee_voice_recorder/core/utils/constants/shared_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'L10n.dart';

class LocaleProvider extends ChangeNotifier {

  final prefs = getIt<SharedPreferences>();

  Locale? _locale;

  LocaleProvider(){
    _locale = Locale(prefs.getString(SharedPreferencesKeys.appLanguage) ?? defaultLanguage);
  }

  Locale? get locale =>  _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}