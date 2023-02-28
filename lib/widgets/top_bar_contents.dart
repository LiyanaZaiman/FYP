import 'package:flutter/material.dart';
import 'package:online_printing/screens/aboutUs.dart';
import 'package:online_printing/screens/home_page.dart';
import 'package:online_printing/screens/login_signup.dart';
import 'package:online_printing/widgets/customer_details.dart';

import '../screens/order_page.dart';

class TopBarContents extends StatefulWidget{
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
  }

  class _TopBarContentsState extends State<TopBarContents> {
    final List _isHovering = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];

    @override
    Widget build(BuildContext context) {
      var screenSize = MediaQuery.of(context).size;
      
      return Container(
        color: Colors.white.withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenSize.width/8,),
                    Text(
                      'Online Printing Service',
                      style: TextStyle(
                        color: Color(0xFF077bd7),
                        fontSize: 23.5,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3,
                       ),
                      ),
                    SizedBox(width: screenSize.width  / 15),
                    InkWell (
                      onHover: (value) {
                    setState(() {
                      value
                      ? _isHovering[0] = true
                      : _isHovering[0] = false;
                    });
                  },
                      onTap: () {                      
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>HomePage()));
                      },
                  child: 
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                          color: _isHovering[0]
                          ? Color(0xFF077bd7)
                          : Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                      
                      SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[0],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: Color(0xFF051441),
                        ),
                      )
                    ],
                  ),
                  
                  ),
                    SizedBox(width: screenSize.width  / 15),
                    InkWell (
                      onHover: (value) {
                    setState(() {
                      value
                      ? _isHovering[1] = true
                      : _isHovering[1] = false;
                    });
                  },
                  onTap: () {                                        
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => OrderPage()));
                      },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Order',
                        style: TextStyle(
                          color: _isHovering[1]
                          ? Color(0xFF077bd7)
                          : Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[1],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: Color(0xFF051441),
                        ),
                      )
                    ],
                  ),),
                    SizedBox(width: screenSize.width  / 15),
                    InkWell (
                      onHover: (value) {
                    setState(() {
                      value
                      ? _isHovering[2] = true
                      : _isHovering[2] = false;
                    });
                  },
                  onTap: () {                    
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>AboutUs()));},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                          color: _isHovering[2]
                          ? Color(0xFF077bd7)
                          : Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[2],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: Color(0xFF051441),
                        ),
                      )
                    ],
                  ),),
                    SizedBox(width: screenSize.width  / 15),
                    InkWell (
                      onHover: (value) {
                    setState(() {
                      value
                      ? _isHovering[3] = true
                      : _isHovering[3] = false;
                    });
                  },
                  onTap: () {
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>LoginSignup()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Login/Signup',
                        style: TextStyle(
                          color: _isHovering[3]
                          ? Color(0xFF077bd7)
                          : Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 5),
                      Visibility(
                        maintainAnimation: true,
                        maintainState: true,
                        maintainSize: true,
                        visible: _isHovering[3],
                        child: Container(
                          height: 2,
                          width: 20,
                          color: Color(0xFF051441),
                        ),
                      )
                    ],
                  ),)
                  ],
                )
              )
            ], 
          ), 
        ),
      );
    }
}