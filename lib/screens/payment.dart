import 'package:flutter/material.dart';
import 'package:online_printing/widgets/bottom_bar.dart';
import 'package:online_printing/widgets/order_details.dart';
import 'package:online_printing/widgets/top_bar_contents.dart';
import 'package:online_printing/widgets/menu_drawer.dart';
import 'package:online_printing/widgets/customer_details.dart';
import 'package:online_printing/screens/order_page.dart';
import 'home_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
          Card(
        color: Colors.white70,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 700,
            child: Column(
              children: <Widget>[
                //WOrdings
                Padding(
                padding: EdgeInsets.all(20.0),
                  child: Text(
                  'You are almost there ^-^',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                padding: EdgeInsets.all(10.0),
                  child: Text(
                  'Please choose your payment method',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              // //Label - payment method
              Row(
                children: [
                Expanded(
                  child: RadioListTile(
                  value: 'onlinetransafer',
                  title: Text('Online Transfer'),
                  groupValue: 'onlinetransafer',
                  onChanged: (value) {
                    setState(() {
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: 'cash',
                    title: Text('Cash'),
                    groupValue: 'cash',
                      onChanged: (value) {
                      setState(() {
                      });
                    },
                  ) 
                ),
              ],
              ), 
                Padding(
                padding: EdgeInsets.all(10.0),
                  child: Text(
                  'Scan QR Code',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                height: screenSize.height * 0.60,
                width: screenSize.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                  'assets/images/qrCode.PNG',
                  fit: BoxFit.contain,
                    ),
                )
                ),
                Padding(
                padding: EdgeInsets.all(10.0),
                  child: Text(
                  '\t\t2231237054 \n\t\tBank Rakyat\nNur Liyana Zaiman',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              //File Upload
              Padding(
                padding: const EdgeInsets.only(
                  top:10,
                  left: 10,
                  right: 10,
                  bottom: 40),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Upload Receipt',
                    prefixIcon: Icon(Icons.file_download),
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
            padding: EdgeInsets.all(10.0),
              child: Text(
              'Total Amount: RM0.00',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //Order Button
            Padding(
            padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                child: Text('Order Now'),
                onPressed: () {
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OrderPage()));
                  }, 
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                textStyle:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        BottomBar(),
      ],
      ),
    )
  );
}
}