import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Company Info"),
        ),
        body: Center(
            child: Text(
                'Company: Geeksynergy Technologies Pvt Ltd\nAddress:  Sanjayanagar, Bengaluru-56\nPhone:XXXXXXXXX09\nEmail: XXXXXX@gmail.com\n')));
  }
}
