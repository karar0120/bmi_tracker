// import 'package:flutter/material.dart';

// class LocalService {

//  static SharedPreferences? _sharedPreferences;

//   static init() async {
//     _sharedPreferences = await SharedPreferences.getInstance();
//   }

//   static setData({required String key, required value}) async {
//     debugPrint(
//         "SharedPreferenceHelper: setData With key: $key and value :$value");
//     switch (value.runtimeType) {
//       case String:
//         await _sharedPreferences!.setString(key, value);
//         break;
//       case int:
//         await _sharedPreferences!.setInt(key, value);
//         break;
//       case bool:
//         await _sharedPreferences!.setBool(key, value);
//         break;
//       case double:
//         await _sharedPreferences!.setDouble(key, value);
//         break;
//       default:
//         return null;
//     }
//   }
// }
