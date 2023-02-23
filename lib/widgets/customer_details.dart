import 'package:online_printing/widgets/responsive.dart';
import 'package:flutter/material.dart';

class CustomerDetails extends StatefulWidget {
  @override
  _CustomerDetails createState() => _CustomerDetails(); 
}

  class _CustomerDetails extends State<CustomerDetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          Container(
          width: 1200,
          height: 700,
          color: Colors.white70,
        ),
        //Label - Customer information
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 70,
              ),
            child: Text(
            'Customer Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        //Name
        Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 200,
          ),
          child: SizedBox( // <-- SEE HERE
            width: 200,
            child: TextField(
            decoration: InputDecoration(
            hintText: 'Enter name',
            labelText: 'Name',
            border: OutlineInputBorder(),
            ),
          ),
                    ),
        ),
        //Contact Number
          Padding(
          padding: const EdgeInsets.only(
            top: 180,
            left: 200,
          ),
          child: SizedBox(
            width: 200,
            child: TextField(
            decoration: InputDecoration(
            hintText: 'Enter contact number',
            labelText: 'Contact Number',
            border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
                    ),
        ),
        //Label - Delivery Options
        Padding(
          padding: EdgeInsets.only(
            top: 250,
            left: 200,
            ),
          child: Text(
          'Delivery',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 250,
            left: 250,
          ),
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
        Padding(
          padding: const EdgeInsets.only(
            top: 250,
            left: 450,),
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
        //Address Line 1
          Padding(
          padding: const EdgeInsets.only(
            top: 300,
            left: 200,
          ),
          child: SizedBox(
            width: 200,
            child: TextField(
            decoration: InputDecoration(
            hintText: 'Enter your adress',
            labelText: 'Address Line',
            border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
                    ),
        ),
        //Address Line 2
          Padding(
          padding: const EdgeInsets.only(
            top: 380,
            left: 200,
          ),
          child: SizedBox(
            width: 200,
            child: TextField(
            decoration: InputDecoration(
            hintText: 'Enter your adress',
            labelText: 'Address Line',
            border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
                    ),
        ),
        //Postcode
          Padding(
          padding: const EdgeInsets.only(
            top: 460,
            left: 200,
          ),
          child: SizedBox(
            width: 200,
            child: TextField(
            decoration: InputDecoration(
            hintText: 'Enter your postcode',
            labelText: 'Postcode',
            border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
                    ),
        ),
          //State
          Padding(
          padding: const EdgeInsets.only(
            top: 460,
            left: 600,
          ),
          child: SizedBox(
            width: 200,
            child: TextField(
            decoration: InputDecoration(
            hintText: 'Enter your state',
            labelText: 'State',
            border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
                    ),
        ),
        //Button
        Center(
          child: Padding(
            padding: EdgeInsets.only(
            top: 550,
            ),
            child: ElevatedButton(
              child: Text('Order Now'),
              onPressed: () {
                }, 
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
          ),
        ),
      ],
  );
  }
}
