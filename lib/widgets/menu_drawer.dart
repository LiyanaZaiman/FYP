import 'package:flutter/material.dart';
import 'package:online_printing_service/view/customer_page/aboutUs.dart';
import 'package:online_printing_service/view/home_page.dart';
import 'package:online_printing_service/view/simple_demo.dart';
import 'package:online_printing_service/view/customer_page/user_profile.dart';
import 'package:online_printing_service/view/sign_in/login.dart';

import 'package:online_printing_service/view/order_page.dart';
import 'package:online_printing_service/view/widgets/productList.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/main_controller.dart';
import '../../di/service_locator.dart';
import '../product_list_page.dart';
import '../sign_in/signup.dart';
import '../stepper_demo.dart';

class MenuDrawer extends StatefulWidget {
  @override
  _MenuDrawer createState() => _MenuDrawer();
}

class _MenuDrawer extends State<MenuDrawer> {
  final mainController = getIt<MainController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF6158e6),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                },
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProductListPage()));
                },
                child: Text(
                  'Product List',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                child: Text(
                  'Order',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderPage()));
                },
              ),

              FutureBuilder(
                  future: mainController.getID(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      final error = snapshot.error;
                      print(error);
                      return const Center(child: Text('Error'));
                    } else if (snapshot.hasData) {
                      print(snapshot.data);
                      if (snapshot.data == "none") {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0),
                                child: Divider(
                                  color: Colors.blueGrey.shade400,
                                  thickness: 2,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginSignup()));
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ]);
                      }
                      ;
                    }
                    return Container();
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SignupPage()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              FutureBuilder(
                  future: mainController.getID(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      final error = snapshot.error;
                      print(error);
                      return const Center(child: Text('Error'));
                    } else if (snapshot.hasData) {
                      print(snapshot.data);
                      if (snapshot.data != "none") {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Divider(
                                color: Colors.blueGrey.shade400,
                                thickness: 2,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Logout();
                              },
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                          ],
                        );
                      }
                      ;
                    }
                    return Container();
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                child: Text(
                  'About Us',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Divider(
                  color: Colors.blueGrey.shade400,
                  thickness: 2,
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.pushReplacement(context,
              //         MaterialPageRoute(builder: (context) => SimpleDemo()));
              //   },
              //   child: Text(
              //     'Demo Upload',
              //     style: TextStyle(color: Colors.white, fontSize: 22),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              //   child: Divider(
              //     color: Colors.blueGrey.shade400,
              //     thickness: 2,
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => StepperDemo()));
              //   },
              //   child: Text(
              //     'Stepper Demo',
              //     style: TextStyle(color: Colors.white, fontSize: 22),
              //   ),
              // ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Copyright © 2023 | Online Printing System',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear().then((value) {
      showDialog(
          context: (context),
          builder: (context) => AlertDialog(
                title: Text("Message"),
                content: Text("Logout successful!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Close'),
                  ),
                ],
              ));
    });
  }
}
