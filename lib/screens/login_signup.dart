import 'package:flutter/material.dart';
import 'package:online_printing/screens/login_page.dart';
import 'package:online_printing/widgets/bottom_bar.dart';
import 'package:online_printing/widgets/top_bar_contents.dart';
import 'package:online_printing/widgets/menu_drawer.dart';
import 'home_page.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
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
      Stack(
        children: [
          Container(
            child: SizedBox(
              height: screenSize.height * 0.60,
              width: screenSize.width,
              child: Image.asset(
                'assets/images/printing_images.png',
                fit: BoxFit.contain,
                )
            ),
          ),
          Container(
          width: 1600,
          height: 400,
          color: Colors.white70,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
            padding: const EdgeInsets.all(30),
                  child: ElevatedButton(
                    child: Text('Staff'),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                      }, 
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                    textStyle:
                        const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
            ),
                Padding(
            padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                child: Text('Customer'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
                  }, 
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                textStyle:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
            ), 
                ],
              ),

            ),
          ),
        ]
      ),
      BottomBar(),
      //   Center(
      //   child: ElevatedButton(
      //     child: const Text('Go Back'),
      //     onPressed: (){
      //     Navigator.pushReplacement(context,
      //                   MaterialPageRoute(builder: (context) => HomePage()));},
      //      ),
      // ),
      ]
      ),
    ),
	);
  }
}