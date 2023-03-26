import 'package:flutter/material.dart';
import 'package:online_printing/screens/aboutUs.dart';
import 'package:online_printing/screens/signup.dart';
import 'package:online_printing/widgets/top_bar_contents.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:online_printing/screens/home_page.dart';
import 'package:online_printing/screens/login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
    final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

    @override
    
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

      int selectedValue = 0; // declare a variable to hold the selected value
  var screenSize = MediaQuery.of(context).size;
  _opacity = _scrollPosition < screenSize.height * 0.40
  ?_scrollPosition / (screenSize.height * 0.40) : 1;

        return Scaffold(
          extendBodyBehindAppBar: false,
              appBar: screenSize.width < 1000?AppBar( //Start here
      iconTheme: IconThemeData(color: Colors.blue),
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(_opacity),
      title:  Text(
                  'Online Printing Service',
                  style: TextStyle(
                    color: Color(0xFF077bd7),
                    fontSize: 23.5,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                    ),
                  ),
    ): 
      PreferredSize( //To make the screen responsive. From Web sie to Moble App size
      preferredSize: Size(screenSize.width, 70),
      child: TopBarContents(_opacity),
    ),
          body: Card(
             color: Colors.white60,
            child: Align(
              alignment: Alignment.center,
              child: Container(
              width: 700,
              child: Column(
                children: <Widget>[
                  // Container(
                  //     alignment: Alignment.center,
                  //     padding: const EdgeInsets.all(10),
                  //     child: const Text(
                  //       'TutorialKart',
                  //       style: TextStyle(
                  //           color: Colors.blue,
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 30),
                  //     )),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500,),
                      )),
                  //Username
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: user,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                    ),
                  ),
                  //password
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: pass,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    child: const Text('Forgot Password',),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        textStyle:
                            const TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                        onPressed: () {
                          login(user.text, pass.text);
                          // Navigator.pushReplacement(
                          // context,
                          // MaterialPageRoute(builder: (context) =>AboutUs()));
                        },
                      )
                  ),
                  Row(
                    children: <Widget>[
                      const Text('Does not have account?'),
                      TextButton(
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {                                    
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>SignUp()));
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              )),
            ),
          ),
        );
  }
  //Login
    void login(String user, String pass) async {
    var url = Uri.http('localhost', '/flutter_api/login.php');
    var response = await http.post(url, body: {
      "username": user,
      "password": pass,
    });

    print(response);
    if (response.statusCode == 200) {
      var userData = json.decode(response.body);
      if (userData == "ERROR"){
        showDialog(context: (context), 
        builder: (context) => AlertDialog(
          title: Text("Message"),
          content: Text("Username and Password invalid!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        )
        );
      }
      else {
        showDialog(context: (context), 
        builder: (context) => AlertDialog(
          title: Text("Message"),
          content: Text("Login Successful"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        )
        );
        print(userData);
      }
    }

  //   if (response.statusCode == 200) {
  //   Fluttertoast.showToast(msg: 'Login successful');
  //   // Navigate to the home page
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => HomePage()),
  //   );
  // } else {
  //   Fluttertoast.showToast(msg: 'Username and pssword invalid: ${response.statusCode}');
  //   // Log the response body for debugging purposes
  //   print(response.body);
  // }

  // var data = json.decode(response.body);
  // if (data == "Success") {
  //   Fluttertoast.showToast(
  //     msg:
  //     'Login Successful',
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     fontSize: 25, 
  //     backgroundColor: Colors.green);
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(),),);
  // } else {
  //   Fluttertoast.showToast(
  //     msg:'Username and password invalid',
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     fontSize: 25, 
  //     backgroundColor: Colors.red);
  // }
   }
}
// class  LoginSignup extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
// 	return Scaffold(
//     body: Center(
//       child: ElevatedButton(
//         child: Text('Go Back'),
//         onPressed: (){
//         Navigator.pop(context,
//                       MaterialPageRoute(builder: (context) => HomePage()));},
//          ),
//     ),
// 	); 
// }
// }  