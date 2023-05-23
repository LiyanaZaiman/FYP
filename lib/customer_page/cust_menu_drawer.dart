import 'package:flutter/material.dart';
import 'package:online_printing_service/view/customer_page/aboutUs.dart';
import 'package:online_printing_service/view/home_page.dart';
import 'package:online_printing_service/view/sign_in/sign_in_page.dart';
import 'package:online_printing_service/view/sign_in/register_page.dart';
import 'package:online_printing_service/view/staff_page/product_records_page.dart';
import 'package:online_printing_service/view/customer_page/user_profile.dart';
import 'package:online_printing_service/view/customer_details.dart';
import 'package:online_printing_service/view/sign_in/login.dart';

import 'package:online_printing_service/view/order_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../staff_page/staff_signin_page.dart';

class CustomerMenuDrawer extends StatefulWidget {
  @override
  _CustomerMenuDrawer createState() => _CustomerMenuDrawer();
}

class _CustomerMenuDrawer extends State<CustomerMenuDrawer> {
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
                child: Text(
                  'Order',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrderPage()));
                },
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
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProductRecordsPage()));
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
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => UserProfile()));
                },
                child: Text(
                  'User Profile',
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
                  Logout();
                },
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
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
    await prefs.remove('userId');
    showDialog(
      context: (context),
      builder: (context) => AlertDialog(
        title: Text("Message"),
        content: Text("Logout successful!"),
        actions: [
          TextButton(
            onPressed: () {
              //Navigator.pop(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text('Close'),
          ),
        ],
      ));
  }
}
