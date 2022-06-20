import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String _isFirstTime = "firsttime";
  static void setFirstTime(bool status) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_isFirstTime, status);
  }

 static Future<bool> getFirstTime() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final _res = sharedPreferences.getBool(_isFirstTime);
    return _res ?? true;
  }
}
