import 'package:flutter/material.dart';
import 'package:online_printing/widgets/bottom_bar.dart';
import 'package:online_printing/widgets/top_bar_contents.dart';
import 'package:online_printing/widgets/menu_drawer.dart';
import 'home_page.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
              child: Padding(
                padding: EdgeInsets.all(80),
                child: const Text(
                'Choong\'s Printing Shop is a family-owned business which provides printing and photocopy services for neighbouring communities. Following the development of technology, it is believed that by making the printing services available online, consumers may feel comfortable in this area as well. The Online Printing Service System is developed primarily to make it easier for the owner to manage and monitor their operations and helps customers to send their item for printing simpler and faster. It is an integrated system which enables customers to remotely send documents they want to print online by accessing the system’s link or scanning unique QR code. The system is accessible to both the owner and the client through a variety of devices, including PCs and mobile phones.',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w200,
                    fontSize: 24),
                      ),
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