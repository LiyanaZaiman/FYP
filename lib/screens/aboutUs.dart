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
    body: Center(
      child: ElevatedButton(
        child: Text('Go Back'),
        onPressed: (){
        Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));},
         ),
    ),
	); 
}
}