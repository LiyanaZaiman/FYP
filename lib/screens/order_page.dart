import 'package:flutter/material.dart';
import 'package:online_printing/widgets/bottom_bar.dart';
import 'package:online_printing/widgets/featured_heading.dart';
import 'package:online_printing/widgets/featured_tiles.dart';
import 'package:online_printing/widgets/top_bar_contents.dart';
import 'package:online_printing/widgets/floating_quick_access_bar.dart';
import 'package:online_printing/widgets/main_heading.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:online_printing/widgets/carousel.dart';
import 'package:online_printing/widgets/menu_drawer.dart';
import 'package:online_printing/widgets/responsive.dart';
import 'package:online_printing/widgets/customer_details.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
          children: [ 
        /*********************Other Widgets Starts Here************************/
        Column(
          children: [
          CustomerDetails(),
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
// class  OrderPage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
// 	return Scaffold(
//     body: Center(
//       child: ElevatedButton(
//         child: Text('Go Back'),
//         onPressed: (){
//         Navigator.pop(context,
//                       MaterialPageRoute(builder: (context) => HomePage()));},
//          ),
//     ),
// 	); 
// }
// }