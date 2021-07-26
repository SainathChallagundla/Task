import 'package:flutter/material.dart';
import 'package:task/LocalStore.dart';
import 'package:task/signup.dart';
import 'homePage.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  String? email, password;
  String? _email, _password;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    this.loggedin_check();
    getinit();
  }

  loggedin_check() async {
    newuser = await getbool() ?? true;

    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  getinit() async {
    String? _email = await getEmail();
    String? _password = await getPassword();
    setState(() {
      email = _email;
      password = _password;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailcontroller = new TextEditingController();
    TextEditingController _passwordcontroller = new TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async{
                  _email = _emailcontroller.text;
                  _password = _passwordcontroller.text;
                  print("--------------------------------------$email");
                  print("--------------------------------------$_email");
                  print("--------------------------------------$password");
                  print("--------------------------------------$_password");

                  _email == email && _password == password
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext) => HomePage()))
                      : showAlertDialog(context);
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (BuildContext) => SignUpPage()));
                },
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Invalid Credentials"),
      content: Text("Please Enter Valid Email or Password"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
