import 'package:online_printing/screens/order_page.dart';
import 'package:online_printing/widgets/responsive.dart';
import 'package:flutter/material.dart';

enum ColourMode { blackwhite, colour }
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  _OrderDetails createState() => _OrderDetails(); 
}

  class _OrderDetails extends State<OrderDetails> {
  TextEditingController service = TextEditingController();
  TextEditingController paperSize = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController set= TextEditingController();
  TextEditingController collectDate = TextEditingController();
  TextEditingController notes = TextEditingController();

  ColourMode? _character = ColourMode.blackwhite;
  String dropdownValue = list.first;

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
              controller: service,
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
                controller: paperSize,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Paper Size',
              prefixIcon: Icon(Icons.pages),
                ),
              ),
            ),
            //Print One Sided
            Padding(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: paperSize,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Print One Sided',
              prefixIcon: Icon(Icons.pages),
                ),
              ),
            ),
            //Potrait Orientation
            Padding(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: paperSize,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Orientation',
              prefixIcon: Icon(Icons.pages),
                ),
              ),
            ),
            //No staplers
            Padding(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: paperSize,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Staplers',
              prefixIcon: Icon(Icons.pages),
                ),
              ),
            ),
            //Sorted
            Padding(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: paperSize,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Sorted',
              prefixIcon: Icon(Icons.pages),
                ),
              ),
            ),
            //Pages per sheet
            Padding(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: paperSize,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pages per sheet',
              prefixIcon: Icon(Icons.pages),
                ),
              ),
            ),
            //Radio Button
            Row(
              children: [
              Expanded(
                child: RadioListTile(
                value: ColourMode.blackwhite,
                title: Text('Black & White'),
                groupValue: _character,
                onChanged: (ColourMode? value) {
                  setState(() {
                    _character = value;});
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: ColourMode.colour,
                  title: Text('Colour'),
                  groupValue: _character,
                    onChanged: (ColourMode? value) {
                    setState(() {
                      _character = value;});
                    },
                  ),
                ),
              ],
            ),   
            //Number of Set
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: set,
                  decoration: InputDecoration(
                    labelText: 'Number of Set',
                    prefixIcon: Icon(Icons.book),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),  
            //Dropdown list
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButton <String>(
                value: dropdownValue,
                onChanged: (String? value) {
                  //This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                    icon: const Icon(Icons.arrow_downward);
                    underline: Container(height: 2, color: Colors.blue
                    );
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem(
                  value: value,
                  child: Text(value));
              }).toList(), ),
            ),
            //Price     
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: price,
                decoration: InputDecoration(
                  labelText: 'Price',
                  prefixIcon: Icon(Icons.money),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ), 
            //Collection Date
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: collectDate,
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
                controller: notes,
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

  Map<String, dynamic> getOrderDetails() {
    return {
      'service': service.text,
      'paperSize': paperSize.text,
      'price': price.text,
      'set': set.text,
      'collectDate': collectDate.text,
      'notes': notes.text,
      'colourMode': _character.toString(),
    };
  }
}
