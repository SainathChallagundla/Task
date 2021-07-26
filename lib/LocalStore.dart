import 'package:shared_preferences/shared_preferences.dart';

setEmail(String email) async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.setString("email", email);
}

setPassword(String password) async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.setString("password", password);
}

setbool(String password) async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  prefs.setBool("login", false);
}

getEmail() async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  print(
      "+++++++++++++++++++++++++++++++++++++++++++++++++=${prefs.getString("email")}");
  return prefs.getString("email");
}

getPassword() async {
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  print(
      "+++++++++++++++++++++++++++++++++++++++++++++++++==${prefs.getString("password")}");
  return prefs.getString("password");
}

getbool()async{
  late SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  return prefs.getBool("login");
}