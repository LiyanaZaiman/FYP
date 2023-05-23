import 'package:flutter/material.dart';
import 'package:online_printing_service/view/widgets/bottom_bar.dart';
import 'package:online_printing_service/view/widgets/top_bar_contents.dart';
import 'package:online_printing_service/view/widgets/menu_drawer.dart';
import 'package:online_printing_service/view/home_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    super.key,
    // required this.customerId,
    // required this.name,
    // required this.gender,
    // required this.phone,
    // required this.email,
    // required this.addressline1,
    // required this.addressline2,
    // required this.postcode,
    // required this.state,
    // required this.password,
  });

  // final String customerId;
  // final String name;
  // final String gender;
  // final String phone;
  // final String email;
  // final String addressline1;
  // final String addressline2;
  // final String postcode;
  // final String state;
  // final String password;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

final customerId = TextEditingController();
final name = TextEditingController();
final gender = TextEditingController();
final phone = TextEditingController();
final email = TextEditingController();
final addressline1 = TextEditingController();
final addressline2 = TextEditingController();
final postcode = TextEditingController();
final state = TextEditingController();
final password = TextEditingController();

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

      // customerId.text = widget.customerId;
      // name.text = widget.name;
      // gender.text = widget.gender;
      // phone.text = widget.phone;
      // email.text = widget.email;
      // addressline1.text = widget.addressline1;
      // addressline2.text = widget.addressline2;
      // postcode.text = widget.postcode;
      // state.text = widget.state;
      // password.text = widget.password;

    int selectedValue = 0; // declare a variable to hold the selected value
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: screenSize.width < 1000
          ? AppBar(
              //Start here
              iconTheme: IconThemeData(color: Colors.blue),
              elevation: 0,
              backgroundColor: Colors.white.withOpacity(_opacity),
              title: Text(
                'Choong\'s Printing Service',
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontSize: 23.5,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              //To make the screen responsive. From Web sie to Moble App size
              preferredSize: Size(screenSize.width, 70),
              child: TopBarContents(_opacity),
            ),
      drawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
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
                        )),
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
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Name:'),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('User Name'),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Phone Number:'),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('01111111111'),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Gender:'),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Male/Female'),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Email:'),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('user email here'),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Address:'),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('user address here'),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Postcode:'),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('user postcode here'),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('State:'),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('user state here'),
                        )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Order Information:'),
                        )),
                        Expanded(
                            child: Padding(
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
        ]),
      ),
    );
  }
}
