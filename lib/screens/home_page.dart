import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:online_printing/widgets/top_bar_contents.dart';
import 'package:online_printing/widgets/floating_quick_access_bar.dart';

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
  var screenSize = MediaQuery.of(context).size;
  _opacity = _scrollPosition < screenSize.height * 0.40
  ?_scrollPosition / (screenSize.height * 0.48) : 1;

  return Scaffold (
    extendBodyBehindAppBar: true,
    appBar: PreferredSize(
      preferredSize: Size(screenSize.width, 70),
      child: TopBarContents(_opacity),
    ),
    body: Column(children: [
      Stack(children: [ Container(
        child: SizedBox(
          height: screenSize.height * 1.0,
          width: screenSize.width,
          child: Image.asset('assets/images/printing_images.png',
          fit: BoxFit.cover,)
        ),
      )
      // FloatingQuickAccessBar(screenSize: screenSize),
      ],)
    ],)
  );
}
}