import 'package:flutter/material.dart';
import 'package:online_printing/widgets/bottom_bar.dart';
import 'package:online_printing/widgets/top_bar_contents.dart';
import 'package:online_printing/widgets/menu_drawer.dart';
import 'home_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
                  'Choong\'s Printing Service',
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
    drawer: MenuDrawer(),
    body: 
    SingleChildScrollView(
      child: Column(
      children: [
                 Card(
        color: Colors.white70,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 700,
            child: Column(
              children: <Widget>[
                //WOrdings
                Padding(
                padding: EdgeInsets.all(20.0),
                  child: Text(
                  'User Profile',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                height: screenSize.height * 0.40,
                width: screenSize.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                  'assets/images/profileIcon.png',
                  fit: BoxFit.contain,
                    ),
                )
                ),
                                Padding(
                padding: EdgeInsets.all(10.0),
                  child: Text(
                  'User Photo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              // //Label - payment method
              Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Name:'),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('User Name'),
                  )),
                ],
              ), 
              Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Phone Number:'),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('01111111111'),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Gender:'),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Male/Female'),
                  )),
                ],
              ),
               Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Email:'),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('user email here'),
                  )),
                ],
              ),
               Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Address:'),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('user address here'),
                  )),
                ],
              ),  
                Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Postcode:'),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('user postcode here'),
                  )),
                ],
              ), 
              Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('State:'),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('user state here'),
                  )),
                ],
              ),
               Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Order Information:'),
                  )),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('User order information status here'),
                  )),
                ],
              ), 
              ],
            ),
          ),
        ),
      ),
      BottomBar(),
      ]
      ),
    ),
	);
  }
}