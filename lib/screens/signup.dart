import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:online_printing/screens/home_page.dart';
import 'package:online_printing/screens/login_page.dart';
import 'package:online_printing/screens/order_page.dart';
import 'package:online_printing/screens/login_signup.dart';
// import 'DashBoard.dart';
// import 'main.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController postcode = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pass = TextEditingController();

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
                      controller: name,
                      decoration: InputDecoration(
                        labelText: 'Customer Name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
              //Label - Gender
              Padding(
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Text(
                'Gender',
                  style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                Expanded(
                  child: RadioListTile(
                  value: 'male',
                  title: Text('Male'),
                  groupValue: 'Male',
                  onChanged: (value) {
                    setState(() {
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: 'female',
                    title: Text('Female'),
                    groupValue: 'female',
                      onChanged: (value) {
                      setState(() {
                        });
                      },
                    ),
                ),
                ],
              ),
                  Padding(
                    padding: const EdgeInsets.all(10.0,),
                    child: TextField(
                      controller: phone,
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
                      controller: email,
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
                      controller: address1,
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
                      controller: address2,
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
                            controller: postcode,
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
                            controller: state,
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
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: TextField(
                  //     controller: user,
                  //     obscureText: true,
                  //     decoration: InputDecoration(
                  //       labelText: 'Username',
                  //       prefixIcon: Icon(Icons.person_2),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(8)),
                  //     ),
                  //   ),
                  // ),
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top:10.0,
                            left: 10,
                            right: 10,
                            bottom: 30),
                          child: MaterialButton(
                            height: 60,
                            color: Colors.blueGrey,
                            child: Text('Register',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            onPressed: () {
                              _showDialog();
                              register(
                                name.text, 
                                gender.text, 
                                phone.text, 
                                email.text, 
                                address1.text,
                                address2.text,
                                postcode.text,
                                state.text,
                                pass.text);
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage(),),);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top:10.0,
                            left: 10,
                            right: 10,
                            bottom: 30),
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

  //Registration 
   void register(
    String name, 
    String gender, 
    String phone, 
    String email, 
    String address1,
    String address2,
    String postcode,
    String state,
    String pass) async {
    //ipaddress: 172.18.82.141
    //var url = Uri.http('https://172.18.82.141/register.php');
    //http://localhost/flutter_api/register.php
    var url = Uri.http('localhost', '/flutter_api/register.php');
    var response = await http.post(url, body: { 
      "name": name, 
      "gender": gender,
      "phone": phone, 
      "email": email,
      "addressline1": address1, 
      "addressline2": address2,
      "postcode": postcode, 
      "state": state,
      "password": pass, });
    // var response = await http.post(url, body: {
    //   "username": user.text,
    //   "password": pass.text,
    // });
    if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: 'Registration successful');
    // Navigate to the home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginSignup()),
    );
  } else {
    Fluttertoast.showToast(msg: 'Registration failed: ${response.statusCode}');
    // Log the response body for debugging purposes
    print(response.body);
  }
  }

  // Define a function to show the pop-up dialog
void _showDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Your registration is successful!'),
        content: Text('Thank you'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
}

//CODES FOR INTEGRATING WITH THE DATABASE
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),),);
//        Fluttertoast.showToast(
//            msg:'Registration Successful',
//            toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIosWeb: 1,
//            fontSize: 25, 
//            backgroundColor: Colors.green);
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),),);
//   if (data == "Registration failed") {
//     // Handle failure
//         Fluttertoast.showToast(
//          msg:
//          'User allready exit!',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIosWeb: 1,
//          backgroundColor: Colors.red,
//          fontSize: 25,
//        );
//   } else {
//     // Handle success
//     Text(
//         'Total Amount: RM0.00',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         );
//      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage(),),);
//   }
// } else {
//   // Handle error
//       Text(
//         'Total Amount: RM0.00',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//   );
// }

    //   var data = json.decode(response.body);
    //  if (data == "Registration failed") {
    //    Fluttertoast.showToast(
    //      msg:
    //      'User allready exit!',
    //      toastLength: Toast.LENGTH_SHORT,
    //      gravity: ToastGravity.CENTER,
    //      timeInSecForIosWeb: 1,
    //      backgroundColor: Colors.red,
    //      fontSize: 25,
    //    );
    //  } else {
    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginSignup(),),);
    //    Fluttertoast.showToast(
    //        msg:'Registration Successful',
    //        toastLength: Toast.LENGTH_SHORT,
    //      gravity: ToastGravity.CENTER,
    //      timeInSecForIosWeb: 1,
    //        fontSize: 25, 
    //        backgroundColor: Colors.green);
    //            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginSignup(),),);
    //  }
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