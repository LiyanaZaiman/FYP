import 'package:flutter/material.dart';
import 'package:online_printing_service/view/home_page.dart';
import 'package:online_printing_service/view/staff_page/admin_home_page.dart';
import 'package:online_printing_service/view/staff_page/order_records_page.dart';
import 'package:online_printing_service/view/staff_page/customer_records_page.dart';
import 'package:online_printing_service/view/staff_page/product_records_page.dart';
import 'package:online_printing_service/view/staff_page/staff_records_page.dart';
import 'package:online_printing_service/view/staff_page/report_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminMenuDrawer extends StatefulWidget {
  @override
  _AdminMenuDrawer createState() => _AdminMenuDrawer(); 
  }

  class _AdminMenuDrawer extends State<AdminMenuDrawer> {
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
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                onTap: () {                      
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminHomePage()));
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
                onTap: () {Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>OrderRecordsPage()));},
                child: Text(
                  'Order Records',
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
                onTap: () {Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>CustomerRecordsPage()));},
                child: Text(
                  'Customer Records',
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
                onTap: () {Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ProductRecordsPage()));},
                child: Text(
                  'Product Records',
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
                onTap: () {Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => StaffRecords()));},
                child: Text(
                  'Staff Records',
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
                onTap: () {Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ReportPage()));},
                child: Text(
                  'Report Page',
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
  Future<void> Logout() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('staffId');
  await prefs.remove('productId');
   showDialog(context: (context), 
    builder: (context) => AlertDialog(
      title: Text("Message"),
      content: Text("Logout successful!"),
      actions: [
        TextButton(
          onPressed: () {
            //Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text('Close'),
        ),
      ],
    )
  );
  }
}