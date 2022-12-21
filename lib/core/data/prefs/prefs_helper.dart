import 'package:arabee_voice_recorder/core/data/models/user_model.dart';
import 'package:arabee_voice_recorder/core/utils/constants/shared_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class PrefsHelper {
  final SharedPreferences prefs;

  PrefsHelper(this.prefs);

  bool get getIsLoggedIn =>
      prefs.getBool(SharedPreferencesKeys.isLoggedBefore) ?? false;

  String get getUserToken => prefs.getString(SharedPreferencesKeys.token) ?? '';

  int get getUserId => prefs.getInt(SharedPreferencesKeys.userId) ?? 0;

  String userFullName() {
    return prefs.getString(SharedPreferencesKeys.name) ?? '';
  }

  Future<void> saveUserInfo(UserModel user) async {
    /// save user info...

    return Future.value();
  }

  Future<void> updateProfile(
      {required String name,
      required String email,
      required String phone}) async {
    /// update user info...

    return Future.value();
  }

  Future<void> clearUserInfo() async {
    prefs.clear();
    return Future.value();
  }

  UserModel get userInfo {
    return UserModel(
      id: prefs.getInt(SharedPreferencesKeys.userId) ?? 0,
      name: prefs.getString(SharedPreferencesKeys.name) ?? '',
      phoneNumber: prefs.getString(SharedPreferencesKeys.phoneNumber) ?? '',
      email: prefs.getString(SharedPreferencesKeys.email) ?? '',
      token: prefs.getString(SharedPreferencesKeys.token) ?? '',
    );
  }

  bool needRefreshToken() {
    int? timestamp = prefs.getInt(SharedPreferencesKeys.storedTokenTime);
    if (timestamp != null) {
      DateTime tokenDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
      DateTime now = DateTime.now();
      final int difference = tokenDate.difference(now).inDays;
      debugPrint("difference = $difference");
      if (difference >= 6) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
