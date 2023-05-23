import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:online_printing_service/view/order_page.dart';
import 'package:online_printing_service/view/widgets/bottom_bar.dart';
import 'package:online_printing_service/view/widgets/menu_drawer.dart';
import '../controllers/main_controller.dart';
import '../di/service_locator.dart';
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

  final mainController = getIt<MainController>();
  FilePickerResult? result;
  File? fileUp;

  @override
  Widget build(BuildContext context) {
    int selectedValue = 0; // declare a variable to hold the selected value
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: screenSize.width < 1000
            ? AppBar(
                //Start here
                iconTheme: IconThemeData(color: Colors.blue),
                elevation: 0,
                backgroundColor: Colors.white.withOpacity(_opacity),
                title: Text(
                  'Choong\'s Printing Service',
                  style: TextStyle(
                    color: Color(0xFF077bd7),
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
              )
            : PreferredSize(
                //To make the screen responsive. From Web sie to Moble App size
                preferredSize: Size(screenSize.width, 70),
                child: SizedBox(),
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
                        // Row(
                        //   children: [
                        //   Expanded(
                        //     child: RadioListTile(
                        //     value: 'onlinetransafer',
                        //     title: Text('Online Transfer'),
                        //     groupValue: 'onlinetransafer',
                        //     onChanged: (value) {
                        //       setState(() {
                        //         });
                        //       },
                        //     ),
                        //   ),
                        //   Expanded(
                        //     child: RadioListTile(
                        //       value: 'cash',
                        //       title: Text('Cash'),
                        //       groupValue: 'cash',
                        //         onChanged: (value) {
                        //         setState(() {
                        //         });
                        //       },
                        //     )
                        //   ),
                        // ],
                        // ),
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
                            )),
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
                        Row(
                          children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () async {
                                  result =
                                      await FilePicker.platform.pickFiles();
                                  if (result != null) {
                                    File file =
                                        File(result!.files.single.path!);
                                    setState(() {
                                      fileUp = file;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.withOpacity(0.5),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  //textStyle: TextStyle()
                                ),
                                child: Text("Receipt Upload"))),
                        if (result != null)
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.4)),
                              ),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: result?.files.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return Text(result?.files[index].name ?? '',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal));
                                  }),
                            ),
                          ),
                          ]
                        )
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //     top:10,
                        //     left: 10,
                        //     right: 10,
                        //     bottom: 40),
                        //   child: TextField(
                        //     decoration: const InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       labelText: 'Upload Receipt',
                        //       prefixIcon: Icon(Icons.file_download),
                        //     ),
                        //   ),
                        // ),
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
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: Text('Order Now'),
                      onPressed: () {
                        if (fileUp != null) {
                          mainController.uploadReceipt(context, fileUp!);
                        } else {
                          print("No file");
                        };
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              BottomBar(),
            ],
          ),
        ));
  }
}
