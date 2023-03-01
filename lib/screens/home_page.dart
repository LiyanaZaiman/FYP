// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:online_printing/screens/order_page.dart';
import 'package:online_printing/widgets/bottom_bar.dart';
import 'package:online_printing/widgets/customer_details.dart';
import 'package:online_printing/widgets/featured_heading.dart';
import 'package:online_printing/widgets/featured_tiles.dart';
import 'package:online_printing/widgets/top_bar_contents.dart';
import 'package:online_printing/widgets/floating_quick_access_bar.dart';
import 'package:online_printing/widgets/main_heading.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:online_printing/widgets/carousel.dart';
import 'package:online_printing/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';


class MainCarousel extends StatefulWidget {
  @override
  _MainCarouselState createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false, false, false, false];
  List _isSelected = [true, false, false, false, false, false, false];

  int _current = 0;

  final List<String> images = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    //'assets/images/antarctica.jpg',
  ];

  final List<String> places = [
    'BLACK & WHITE',
    'COLOUR',
    'A4',
    'A5',
    'A3',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }

                });
              }),
          carouselController: _controller,
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              places[_current],
              style: TextStyle(
                letterSpacing: 8,
                fontFamily: 'Electrolize',
                fontSize: screenSize.width / 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
         AspectRatio(
                aspectRatio: 17 / 8,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width / 8,
                        right: screenSize.width / 8,
                      ),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height / 50,
                            bottom: screenSize.height / 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < places.length; i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[i] = true
                                              : _isHovering[i] = false;
                                        });
                                      },
                                      onTap: () {
                                        _controller.animateToPage(i);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height / 80,
                                            bottom: screenSize.height / 90),
                                        child: Text(
                                          places[i],
                                          style: TextStyle(
                                            color: _isHovering[i]
                                                ? Colors.blueGrey[900]
                                                : Colors.blueGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[i],
                                      child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 400),
                                        opacity: _isSelected[i] ? 1 : 0,
                                        child: Container(
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          width: screenSize.width / 10,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  return Scaffold (
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
    body: SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
        Stack(
          children: [ Container(
          child: SizedBox(
            height: screenSize.height * 0.80,
            width: screenSize.width,
            child: Image.asset(
              'assets/images/image01.jpg',
              fit: BoxFit.cover,
              )
          ),
        ),
        /*********************Other Widgets Starts Here************************/
        Column(
          children: [
          //CustomerDetails(),
          Container(
          width: 1600,
          height: 700,
          color: Colors.white70,
          child: Align(
          alignment: Alignment.center,
          child: Text(
            'Online Printing Service System',
            //textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color:Color.fromARGB(255, 8, 66, 114) , 
            ),
          ),
          ),
        ),
          FeaturedTiles(screenSize: screenSize),
          FeaturedHeading(screenSize: screenSize),
          MainHeading(screenSize: screenSize),
          MainCarousel(),
          SizedBox(height: screenSize.height / 10,),
          BottomBar(),
          ],
        ),
        ]
        )
      ],),
    )
  );
}
}