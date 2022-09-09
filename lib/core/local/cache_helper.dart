import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBoolean({String? key, bool? value}) async {
    return await sharedPreferences!.setBool(key!, value!);
  }

  static bool? getBoolean({String? key}) {
    return sharedPreferences?.getBool(key!);
  }

  static setFavLocation({String? key, String? value}) async {
    return await sharedPreferences!.setString(key!, value!);
  }

  static getFavLocation({String? key}) {
    return sharedPreferences?.getString(key!);
  }
}
