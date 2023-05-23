import 'package:flutter/material.dart';
import 'package:online_printing_service/view/order_page.dart';
import 'package:online_printing_service/view/widgets/bottom_bar.dart';
//import 'package:online_printing_service/view/widgets/customer_details.dart';
import 'package:online_printing_service/view/widgets/featured_heading.dart';
import 'package:online_printing_service/view/widgets/featured_tiles.dart';
import 'package:online_printing_service/view/staff_page/admin_menu_drawer.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePage createState() => _AdminHomePage();
}

class _AdminHomePage extends State<AdminHomePage> {
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
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    //Future.delayed(Duration.zero, () => showAlert(context));
    //showAlert(context);

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
                child: SizedBox(),
                //TopBarContents(_opacity),
              ),
        drawer: AdminMenuDrawer(),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Stack(children: [
                Container(
                  child: SizedBox(
                      height: screenSize.height * 0.80,
                      width: screenSize.width,
                      child: Image.asset(
                        'assets/images/image01.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
                /*********************Other Widgets Starts Here************************/
                Column(
                  children: [
                    //CustomerDetails(),
                    Container(
                      width: 1600,
                      height: 650,
                      color: Colors.white70,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Online Printing Service System',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 8, 66, 114),
                          ),
                        ),
                      ),
                    ),
                    //MainHeading(screenSize: screenSize),
                    FeaturedHeading(screenSize: screenSize),
                    //productList(),
                    FeaturedTiles(screenSize: screenSize),
                    //MainCarousel(),
                    SizedBox(
                      height: screenSize.height / 10,
                    ),
                    BottomBar(),
                  ],
                ),
              ])
            ],
          ),
        ));
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: ElevatedButton(
                child: Text('Click Here to Order Now'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => OrderPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 28),
                    textStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ));
  }
}
