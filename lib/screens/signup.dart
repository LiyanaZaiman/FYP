import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:online_printing/screens/home_page.dart';
import 'package:online_printing/screens/login_signup.dart';
// import 'DashBoard.dart';
// import 'main.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final user = TextEditingController();
  final pass = TextEditingController();

  Future<void> register() async {
    //ipaddress: 172.18.82.141
    var url = Uri.http('https://localhost/register.php');
    var response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        msg:
        'User allready exit!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        fontSize: 25,
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginSignup(),),);
      Fluttertoast.showToast(
          msg:'Registration Successful',
          toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
          fontSize: 25, 
          backgroundColor: Colors.green);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginSignup(),),);
    }
    //Example from Pub Dev
    // Fluttertoast.showToast(
    //     msg: "This is Center Short Toast",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: InkWell(
        child: const Text(
          'Back',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {                                    
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>LoginSignup()));
        },
    )
      ),
      body: 
      SingleChildScrollView(
        child: Card(
          color: Colors.white70,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              //height: 300,
              width:700,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0,),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Customer Name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0,),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'PhoneNumber',
                        prefixIcon: Icon(Icons.phone_android_rounded),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0,),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0,),
                    child: TextField(
                      controller: user,
                      decoration: InputDecoration(
                        labelText: 'Address Line 1',
                        prefixIcon: Icon(Icons.house),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0,),
                    child: TextField(
                      controller: user,
                      decoration: InputDecoration(
                        labelText: 'Address Line 2',
                        prefixIcon: Icon(Icons.house),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0,),
                          child: TextField(
                            controller: user,
                            decoration: InputDecoration(
                              labelText: 'Postcode',
                              prefixIcon: Icon(Icons.location_city),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0,),
                          child: TextField(
                            controller: user,
                            decoration: InputDecoration(
                              labelText: 'State',
                              prefixIcon: Icon(Icons.location_city_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person_2),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                          height: 60,
                          color: Colors.blueGrey,
                          child: Text('Register',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          onPressed: () {
                            register();
                          },
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: 60,
                          color: Colors.amber[100],
                          child: Text('Login',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginSignup(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}