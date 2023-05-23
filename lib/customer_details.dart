import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:online_printing_service/view/sign_in/sign_in_page.dart';
import 'package:online_printing_service/view/order_page.dart';
import 'package:online_printing_service/view/simple_demo.dart';
import 'package:online_printing_service/view/widgets/responsive.dart';
import 'package:online_printing_service/view/sign_in/login.dart';
import 'package:flutter/material.dart';

import '../controllers/order_controller.dart';
import '../di/service_locator.dart';

enum DeliveryOption { delivery, selfCollect }

class CustomerDetails extends StatefulWidget {
  @override
  _CustomerDetails createState() => _CustomerDetails();
}

class _CustomerDetails extends State<CustomerDetails> {
  DeliveryOption? _character = DeliveryOption.delivery;
  final orderController = getIt<OrderController>();
  bool? deliveryStatus = true;
  String? id = "No ID";

  @override
  void initState() {
    mainController.getID().then((value) {
      print("Value getID"+value);
      if (value != 'none') {
        id = value;
        orderController.getCustInfo();
      }else{
        //id = "No ID";
        orderController.nameController.text = "";
        orderController.phoneController.text = "";
        orderController.addressline1Controller.text = "";
        orderController.addressline2Controller.text = "";
        orderController.postcodeController.text = "";
        orderController.stateController.text = "";
      }
    });

    //print("Current ID : " + id!);
    super.initState();
  }

  // @override
  // void dispose() {
  //   orderController.nameController.dispose();
  //   super.dispose();
  // }



  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 700,
          child: Column(children: <Widget>[
            //Customer Information
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Customer Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    if (id == "No ID") ...[
                      RichText(
                        text: TextSpan(
                            text: 'A regular customer? Login your account',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' here',
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 16),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginSignup()));
                                    })
                            ]),
                      )
                    ]
                  ],
                )),
            //Name
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: orderController.nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            //Contact Number
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: orderController.phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Customer Number',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            //Label - Delivery Options
            Padding(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Delivery',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: DeliveryOption.delivery,
                    title: Text('delivery'),
                    groupValue: _character,
                    onChanged: (DeliveryOption? value) {
                      setState(() {
                        _character = value;
                        //orderController.deliveryType = _character;
                        orderController.delivery(_character);
                        deliveryStatus = true;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: DeliveryOption.selfCollect,
                    title: Text('self collect'),
                    groupValue: _character,
                    onChanged: (DeliveryOption? value) {
                      setState(() {
                        _character = value;
                        //orderController.deliveryType = _character;
                        orderController.delivery(_character);
                        deliveryStatus = false;
                      });
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: deliveryStatus!,
              child: Form(
                  child: Column(
                children: [
                  //Address Line 1
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: orderController.addressline1Controller,
                      decoration: InputDecoration(
                        labelText: 'Address Line 1',
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  //Address Line 2
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: orderController.addressline2Controller,
                      decoration: InputDecoration(
                        labelText: 'Address Line 2',
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                  //Postcode
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: orderController.postcodeController,
                            decoration: InputDecoration(
                              labelText: 'Postcode',
                              prefixIcon: Icon(Icons.local_post_office),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                      //State
                      Expanded(
                        child: Padding(
                          //alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: orderController.stateController,
                            decoration: InputDecoration(
                              labelText: 'State',
                              prefixIcon: Icon(Icons.map),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            ),
          ]),
        ),
      ),
    );
    
  }
  
}
