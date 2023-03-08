import 'package:online_printing/screens/order_page.dart';
import 'package:online_printing/widgets/responsive.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetails createState() => _OrderDetails(); 
}

  class _OrderDetails extends State<OrderDetails> {
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
                Padding(
                padding: EdgeInsets.all(10.0),
                  child: Text(
                  'Order Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              //File Upload
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Upload File Here',
                    prefixIcon: Icon(Icons.file_download),
                  ),
                ),
              ),
              //Type of service
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type of Service',
                prefixIcon: Icon(Icons.design_services),
              ),
                ),
              ),
              //Paper Size
              Padding(
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: TextField(
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Paper Size',
                prefixIcon: Icon(Icons.pages),
                  ),
                ),
              ),
              Row(
                children: [
                Expanded(
                  child: RadioListTile(
                  value: 'blackwhite',
                  title: Text('Black & White'),
                  groupValue: 'blackwhite',
                  onChanged: (value) {
                    setState(() {
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: 'colour',
                    title: Text('Colour'),
                    groupValue: 'colour',
                      onChanged: (value) {
                      setState(() {
                        });
                      },
                    ),
                  ),
                ],
              ),
              //Price     
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    prefixIcon: Icon(Icons.money),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),    
              //Number of Set
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Number of Set',
                      prefixIcon: Icon(Icons.book),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),   
              //Collection Date
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Collection Date',
                      prefixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              //Notes
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Notes (optional)',
                      prefixIcon: Icon(Icons.note),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),  
              ]
            ),
          ),
        ),
      ); 
  }
}
