import 'package:bmi_tracker/core/helper/constances.dart';
import 'package:bmi_tracker/core/helper/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferences({required this.sharedPreferences});

  Future<void> setAccessToken({required String accessToken}) async {
    sharedPreferences.setData(key: Constances.accessToken, value: accessToken);
    getAccessToken();
  }

  dynamic getAccessToken() {
    String accessToken =
        sharedPreferences.getString(Constances.accessToken) ?? "";
    return accessToken;
  }

  Future<bool> clearAll() async {
    return await sharedPreferences.clear();
  }
}
