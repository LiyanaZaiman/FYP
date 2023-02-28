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
      //controller: _scrollController,
      child: Column(
        children: [
        CustomerDetails(),
        // Container(
        // alignment: Alignment.center,
        // child: Padding(
        // padding: EdgeInsets.only(
        //   top: 70,
        //   ),
        // child: Text(
        // 'Customer Information',
        // style: TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold,
        // ),
        // ),
        // ),
       // ),
    //       ListView(
    //   children: <Widget>[
    //           // Container(
    //           //   alignment: Alignment.center,
    //           //   padding: const EdgeInsets.all(10),
    //           //   child: const Text(
    //           //     'Login',
    //           //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500,),
    //           //   ),
    //           // ),
      
    //         //Label - Customer information
    //         Container(
    //           alignment: Alignment.center,
    //           child: Padding(
    //           padding: EdgeInsets.only(
    //             top: 70,
    //             ),
    //           child: Text(
    //           'Customer Information',
    //           style: TextStyle(
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           ),
    //         ),
    //         //Name
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           child: TextField(
    // decoration: const InputDecoration(
    //   border: OutlineInputBorder(),
    //   labelText: 'Enter Name',
    // ),
    //           ),
    //         ),
    //         //Contact Number
    //         Container(
    //           padding: const EdgeInsets.all(10),
    //           child: TextField(
    // decoration: const InputDecoration(
    //   border: OutlineInputBorder(),
    //   labelText: 'Customer Number',
    // ),
    //           ),
    //         ),
    //         //Label - Delivery Options
    //         Container(
    //           alignment: Alignment.center,
    //           padding: const EdgeInsets.all(10),
    //           child: Text(
    //           'Delivery',
    //           style: TextStyle(
    // fontSize: 14,
    // fontWeight: FontWeight.bold,
    // ),
    //           ),
    //         ),
    //         Row(
    //           children: [
    // RadioListTile(
    // value: 'delivery',
    // title: Text('delivery'),
    // groupValue: 'delivery',
    // onChanged: (value) {
    //   setState(() {
    //     });
    //   },
    // ),
    //           RadioListTile(
    //           value: 'Self Collect',
    //           title: Text('self collect'),
    //           groupValue: 'self collect',
    //           onChanged: (value) {
    // setState(() {
    //   });
    //           },
    //           ),
    //           ],
    //           mainAxisAlignment: MainAxisAlignment.start,
    //         ),
    //         //Address Line 1          
    //         Container(
    //           alignment: Alignment.center,
    //           padding: const EdgeInsets.all(10),
    //           child: Text(
    //           'Address Line',
    //           style: TextStyle(
    // fontSize: 14,
    // fontWeight: FontWeight.bold,
    // ),
    //           ),
    //         ),    
    //         //Address Line 2
    //         Container(
    //           alignment: Alignment.center,
    //           padding: const EdgeInsets.all(10),
    //           child: Text(
    //           'Address Line',
    //           style: TextStyle(
    // fontSize: 14,
    // fontWeight: FontWeight.bold,
    // ),
    //           ),
    //         ),   
    //         //Postcode
    //         Container(
    //           alignment: Alignment.center,
    //           padding: const EdgeInsets.all(10),
    //           child: Text(
    //           'PostCode',
    //           style: TextStyle(
    // fontSize: 14,
    // fontWeight: FontWeight.bold,
    // ),
    //           ),
    //         ), 
    //           //State
    //         Container(
    //           alignment: Alignment.center,
    //           padding: const EdgeInsets.all(10),
    //           child: Text(
    //           'State',
    //           style: TextStyle(
    // fontSize: 14,
    // fontWeight: FontWeight.bold,
    // ),
    //           ),
    //         ), 
    //         //Button
    //         Container(
    //         alignment: Alignment.center,
    //         padding: const EdgeInsets.all(10),
    //           child: ElevatedButton(
    //             child: Text('Order Now'),
    //             onPressed: () {
    //       Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (context) => OrderPage()));
    //               }, 
    //             style: ElevatedButton.styleFrom(
    //             backgroundColor: Colors.blueAccent,
    //             padding:
    //                 const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
    //             textStyle:
    //                 const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    //             ),
    //         ),
    //       ],
    //     ),
        BottomBar(),
        ],
      ),
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