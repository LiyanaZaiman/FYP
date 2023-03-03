import 'package:online_printing/screens/login_signup.dart';
import 'package:online_printing/screens/order_page.dart';
import 'package:online_printing/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CustomerDetails extends StatefulWidget {
  @override
  _CustomerDetails createState() => _CustomerDetails(); 
}

  class _CustomerDetails extends State<CustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return  Card(
        color: Colors.white70,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 700,
            child: Column(
              children: <Widget>[
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
                  child: InkWell(
                    onTap: () {                      
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>LoginSignup()));
                      },
                    child: Text(
                    'A regular customer? Login your account here',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              //Name
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
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
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Customer Number',
                prefixIcon: Icon(Icons.person),
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
                  value: 'delivery',
                  title: Text('delivery'),
                  groupValue: 'delivery',
                  onChanged: (value) {
                    setState(() {
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: 'Self Collect',
                    title: Text('self collect'),
                    groupValue: 'self collect',
                      onChanged: (value) {
                      setState(() {
                        });
                      },
                    ),
                ),
                ],
              ),
              //Address Line 1          
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Address Line 1',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),    
              //Address Line 2
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Address Line 1',
                      prefixIcon: Icon(Icons.person),
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
                    decoration: InputDecoration(
                      labelText: 'Postcode',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                      ),
                    ),
                  ), 
                    //State
                  Expanded
                  (
                    child: Padding(
                      //alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Address Line 1',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                      ),
                    ),
                  ),
                ],
              ), 
              ]
            ),
          ),
        ),
      ); 
  }
}
