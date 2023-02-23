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
    'assets/images/antarctica.jpg',
  ];

  final List<String> places = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA',
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
    extendBodyBehindAppBar: true,
    appBar: screenSize.width < 1000?AppBar( //Start here
      iconTheme: IconThemeData(color: Colors.blue),
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(_opacity),
      title:  Text(
                  'Online Printing Service',
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
              'assets/images/printing_images.png',
              fit: BoxFit.cover,
              )
          ),
        ),
        /*********************Other Widgets Starts Here************************/
        Column(
          children: [
          //CustomerDetails(screenSize: screenSize),
          //FloatingQuickAccessBar(screenSize: screenSize),
          Stack(
            children: [
                Container(
                width: 1200,
                height: 700,
                color: Colors.white70,
              ),
              //Label - Customer information
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 70,
                    ),
                  child: Text(
                  'Customer Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //Name
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  left: 200,
                ),
                child: SizedBox( // <-- SEE HERE
                  width: 200,
                  child: TextField(
                  decoration: InputDecoration(
                  hintText: 'Enter name',
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  ),
                ),
                          ),
              ),
              //Contact Number
                Padding(
                padding: const EdgeInsets.only(
                  top: 180,
                  left: 200,
                ),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                  decoration: InputDecoration(
                  hintText: 'Enter contact number',
                  labelText: 'Contact Number',
                  border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                          ),
              ),
              //Label - Delivery Options
              Padding(
                padding: EdgeInsets.only(
                  top: 250,
                  left: 200,
                  ),
                child: Text(
                'Delivery',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 250,
                  left: 250,
                ),
                child: RadioListTile(
                value: 'delivery',
                title: Text('delivery'),
                groupValue: 'delivery',
                onChanged: (value) {
                  setState(() {
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 250,
                  left: 450,),
                child: RadioListTile(
                value: 'Self Collect',
                title: Text('self collect'),
                groupValue: 'self collect',
                onChanged: (value) {
                  setState(() {
                    });
                  },
                ),
              ),
              //Address Line 1
                Padding(
                padding: const EdgeInsets.only(
                  top: 300,
                  left: 200,
                ),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                  decoration: InputDecoration(
                  hintText: 'Enter your adress',
                  labelText: 'Address Line',
                  border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                          ),
              ),
              //Address Line 2
                Padding(
                padding: const EdgeInsets.only(
                  top: 380,
                  left: 200,
                ),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                  decoration: InputDecoration(
                  hintText: 'Enter your adress',
                  labelText: 'Address Line',
                  border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                          ),
              ),
              //Postcode
                Padding(
                padding: const EdgeInsets.only(
                  top: 460,
                  left: 200,
                ),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                  decoration: InputDecoration(
                  hintText: 'Enter your postcode',
                  labelText: 'Postcode',
                  border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                          ),
              ),
                //State
                Padding(
                padding: const EdgeInsets.only(
                  top: 460,
                  left: 600,
                ),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                  decoration: InputDecoration(
                  hintText: 'Enter your state',
                  labelText: 'State',
                  border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                          ),
              ),
              //Button
              Center(
                child: Padding(
                 padding: EdgeInsets.only(
                  top: 550,
                 ),
                  child: ElevatedButton(
                    child: Text('Order Now'),
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderPage()));
                      }, 
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                    textStyle:
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                ),
              ),
            ],
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