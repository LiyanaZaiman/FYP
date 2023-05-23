import 'package:flutter/material.dart';
import 'package:online_printing_service/view/sign_in/sign_in_page.dart';
import 'package:online_printing_service/view/widgets/bottom_bar.dart';
import 'package:online_printing_service/view/widgets/top_bar_contents.dart';
import 'package:online_printing_service/view/widgets/menu_drawer.dart';
import 'package:online_printing_service/view/home_page.dart';

import '../staff_page/staff_signin_page.dart';
import 'register_page.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
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
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          extendBodyBehindAppBar: false,
      appBar: AppBar(
        //Start here
        iconTheme: const IconThemeData(color: Colors.blue),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Online Printing Service',
          style: TextStyle(
            color: Color(0xFF077bd7),
            fontSize: 23.5,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
          ),
        ),
      ),
    drawer: MenuDrawer(),
    body: 
    Column(
    children: [
       Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 40,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: TabBar(
                      physics: BouncingScrollPhysics(),
                      splashFactory: NoSplash.splashFactory,
                      splashBorderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: Color.fromARGB(249, 35, 49, 66),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      tabs: const [
                        Tab(
                          text: 'Admin',
                        ),
                        Tab(
                          text: 'Customer',
                        ),
                      ],
                    ),
                  ),
                ),
                // tab bar view here
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    controller: _tabController,
                    children: const [
                      // first tab bar view widget
                      Center(child: StaffSignInPage()),
                      // second tab bar view widget
                      Center(child: SignInPage()),
                    ],
                  ),
                ),
    // Stack(
    //   children: [
    //     Container(
    //       child: SizedBox(
    //         height: screenSize.height * 0.60,
    //         width: screenSize.width,
    //         child: Image.asset(
    //           'assets/images/printing_images.png',
    //           fit: BoxFit.contain,
    //           )
    //       ),
    //     ),
    //     Container(
    //     width: 1600,
    //     height: 400,
    //     color: Colors.white70,
    //       child: Align(
    //         alignment: Alignment.center,
    //         child: Column(
    //           children: [
    //             Padding(
    //       padding: const EdgeInsets.all(30),
    //             child: ElevatedButton(
    //               child: Text('Staff'),
    //               onPressed: () {
    //                 Navigator.pushReplacement(context,
    //                 MaterialPageRoute(builder: (context) => SignInPage()));
    //                 }, 
    //               style: ElevatedButton.styleFrom(
    //               backgroundColor: Colors.blueAccent,
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
    //               textStyle:
    //                   const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    //               ),
    //       ),
    //           Padding(
    //       padding: const EdgeInsets.all(30),
    //         child: ElevatedButton(
    //           child: Text('Customer'),
    //           onPressed: () {
    //             Navigator.pushReplacement(context,
    //             MaterialPageRoute(builder: (context) => SignInPage()));
    //             }, 
    //           style: ElevatedButton.styleFrom(
    //           backgroundColor: Colors.blueAccent,
    //           padding:
    //               const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
    //           textStyle:
    //               const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    //           ),
    //       ), 
    //           ],
    //         ),
    
    //       ),
    //     ),
    //   ]
    // ),
     // BottomBar(),
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
	);
  }
}