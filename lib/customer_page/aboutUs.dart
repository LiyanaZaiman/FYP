import 'package:flutter/material.dart';
import 'package:online_printing_service/view/widgets/bottom_bar.dart';
import 'package:online_printing_service/view/widgets/top_bar_contents.dart';
import 'package:online_printing_service/view/widgets/menu_drawer.dart';
import 'package:online_printing_service/view/home_page.dart';

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
              height: screenSize.height * 0.80,
              width: double.infinity,
              child: Image.asset(
                'assets/images/image01.jpg',
                fit: BoxFit.cover,
                )
            ),
          ),
          Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white70.withOpacity(0.9),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: const Text(
                "Choong\'s Printing Shop is a family-owned business which provides printing and photocopy services for neighbouring communities. " + 
                "\n\nFollowing the development of technology, it is believed that by making the printing services available online, consumers may feel comfortable in this area as well." + 
                "\nThe Online Printing Service System is developed primarily to make it easier for the owner to manage and monitor their operations and helps customers to send their item for printing simpler and faster. " +
                "\n\nIt is an integrated system which enables customers to remotely send documents they want to print online by accessing the system\’s link or scanning unique QR code." + 
                "\n\nThe system is accessible to both the owner and the client through a variety of devices, including PCs and mobile phones.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
                      ),
              ),
              
            ),
          ),
        ]
      ),
      BottomBar(),
      ]
      ),
    ),
	);
  }
}