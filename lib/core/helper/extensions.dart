import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension LocaleShared on SharedPreferences {
  Future setData({required String key, required value}) async {
    debugPrint(
        "SharedPreferenceHelper: setData With key: $key and value :$value");
    switch (value.runtimeType) {
      case String:
        await setString(key, value);
        break;
      case int:
        await setInt(key, value);
        break;
      case bool:
        await setBool(key, value);
        break;
      case double:
        await setDouble(key, value);
        break;
      default:
        return null;
    }
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

String findStatus(tempBMI) {
  if (tempBMI < 18.5) {
    return "UnderWeight";
  }
  if (tempBMI > 18.5 && tempBMI < 24.9) {
    return "Normal";
  }
  if (tempBMI > 25.0 && tempBMI < 29.9) {
    return "OverWeight";
  }
  if (tempBMI > 30.0 && tempBMI < 34.9) {
    return "OBESE";
  }
  if (tempBMI > 35.0) {
    return "Extremely OBESE";
  }
  return '';
}

Color findColor(tempBMI) {
  if (tempBMI < 18.5) {
    return const Color(0xffFFB800);
  }
  if (tempBMI > 18.5 && tempBMI < 24.9) {
    return const Color(0xff00CA39);
  }
  if (tempBMI > 25.0 && tempBMI < 29.9) {
    return const Color(0xffFF5858);
  }
  if (tempBMI > 30.0 && tempBMI < 34.9) {
    return const Color(0xffFF0000);
  }
  if (tempBMI > 35.0) {
    return const Color(0xff000000);
  }
  return const Color(0xff246AFE);
}
