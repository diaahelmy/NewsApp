import 'package:shared_preferences/shared_preferences.dart';

class Cache
{
  static late SharedPreferences sharedPreferences;

 static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

static  Future<void> setData({required String key, required bool value}) async {
    sharedPreferences.setBool(key, value);
  }

  static  bool? getData({required String key})  {
   return sharedPreferences.getBool(key);
  }
}
