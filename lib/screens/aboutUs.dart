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
import 'home_page.dart';


class  AboutUs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
	return Scaffold(
    body: 
    Column(
    children: [Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: const Text(
      ' Choongs Printing Shop is a family-owned business which provides printing and photocopy services for neighbouring communities. Following the development of technology, it is believed that by making the printing services available online, consumers may feel comfortable in this area as well. The Online Printing Service System is developed primarily to make it easier for the owner to manage and monitor their operations and helps customers to send their item for printing simpler and faster. It is an integrated system which enables customers to remotely send documents they want to print online by accessing the system’s link or scanning unique QR code. The system is accessible to both the owner and the client through a variety of devices, including PCs and mobile phones.',
      style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w200,
          fontSize: 30),
    )),
      Center(
      child: ElevatedButton(
        child: const Text('Go Back'),
        onPressed: (){
        Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));},
         ),
    )
    ]
    ),
	); 
}
}