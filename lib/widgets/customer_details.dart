import 'package:online_printing/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  

  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenSize.height * 0.60,
          left: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.width / 12
              : screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.width / 12
              : screenSize.width / 5,
        ),
      ),
    );
  }
    throw UnimplementedError();
  }

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   Center(
  //     child: Container(
  //     width: 200.0,
  //     height: 300.0,
  //     color: Colors.blueGrey,
  //     ),
  //   );
  //   throw UnimplementedError();
  // }
}