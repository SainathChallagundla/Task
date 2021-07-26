import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Task")),
        body: Center(
          child: Text("HomePage"),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          late SharedPreferences prefs;
          prefs = await SharedPreferences.getInstance();
          prefs.remove("email");
          prefs.remove("password");
        Navigator.push(
            context, MaterialPageRoute(builder: (BuildContext) => UserLogin()));
        }));
  }
}
