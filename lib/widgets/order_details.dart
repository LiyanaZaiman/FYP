import 'package:online_printing/screens/order_page.dart';
import 'package:online_printing/widgets/responsive.dart';
import 'package:flutter/material.dart';

enum ColourMode { blackwhite, colour }
const List<String> paperSizeType = <String>['A4', 'A3', 'A5'];
const List<String> paperOrientation = <String>['Potrait', 'Horizontal'];
const List<String> service = <String>['NormalPaper', 'HardCover', 'Poster'];
const List<String> sided = <String>['One-sided', 'Both-sided'];
const List<String> staplersrsOrNot = <String>['No-staplers', 'With-staplers'];
const List<String> sortedOrNot = <String>['Sorted', 'Unsorted'];

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  _OrderDetails createState() => _OrderDetails(); 
}

  class _OrderDetails extends State<OrderDetails> {
 //TextEditingController service = TextEditingController();
  //TextEditingController paperSize = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController set= TextEditingController();
  TextEditingController collectDate = TextEditingController();
  TextEditingController notes = TextEditingController();

  ColourMode? _character = ColourMode.blackwhite;
  String paperSize = paperSizeType.first;
  String orientation = paperOrientation.first;
  String printingService = service.first;
  String paperSided = sided.first;
  String staplers = staplersrsOrNot.first;
  String sorted = sortedOrNot.first;

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
            Row(  
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Type of Service'),
                  // child: TextField(
                  // controller: service,
                  //   decoration: const InputDecoration(
                  //   border: OutlineInputBorder(),
                  //   labelText: 'Type of Service',
                  //   prefixIcon: Icon(Icons.design_services),
                    //),
                  // ),
                ),
                //Dropdown list
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton <String>(
                      value: printingService,
                      isExpanded: true,
                      
                      onChanged: (String? value) {
                        //This is called when the user selects an item.
                        setState(() {
                          printingService = value!;
                          icon: const Icon(Icons.arrow_downward);
                          underline: Container(height: 2,//color: Colors.blueGrey
                          );
                        });
                      },
                      items: service.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value));
                    }).toList(), ),
                  ),
                ),
              ],
            ),
            //Paper Size
            Row(
              children: [
                Padding(
                  //alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Text('Paper Size:'),
                  // child: TextField(
                  //   controller: paperSize,
                  // decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  // labelText: 'Paper Size',
                  // prefixIcon: Icon(Icons.pages),
                  //   ),
                  // ),
                ),
                //Dropdown list
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton <String>(
                      value: paperSize,
                      isExpanded: true,            
                      onChanged: (String? value) {
                        //This is called when the user selects an item.
                        setState(() {
                          paperSize = value!;
                          icon: const Icon(Icons.arrow_downward);
                          underline: Container(height: 2,color: Colors.blueGrey
                          );
                        });
                      },
                      items: paperSizeType.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value));
                    }).toList(), ),
                  ),
                ),
              ],
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
            //Print One Sided
            Row(
              children: [
                Padding(
                  //alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Text('Print One Sided')
                  // child: TextField(
                  //   //controller: paperSize,
                  // decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  // labelText: 'Print One Sided',
                  // prefixIcon: Icon(Icons.pages),
                  //   ),
                  // ),
                ),
                //Dropdown List
                Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DropdownButton <String>(
                          value: paperSided,
                          isExpanded: true,
                          onChanged: (String? value) {
                            //This is called when the user selects an item.
                            setState(() {
                              paperSided = value!;
                              icon: const Icon(Icons.arrow_downward);
                              underline: Container(height: 2,color: Colors.blueGrey
                              );
                            });
                          },
                          items: sided.map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value));
                        }).toList(), ),
                      ),
                    ),
              ],
            ),
            //Potrait Orientation
            Row(
              children: [
                Padding(
                  //alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Text('Paper Orientation'),
                  // child: TextField(
                  //   controller: paperSize,
                  // decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  // labelText: 'Orientation',
                  // prefixIcon: Icon(Icons.pages),
                  //   ),
                  // ),
                ),
                //Dropdown list
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton <String>(
                      value: orientation,
                      isExpanded: true,
                      onChanged: (String? value) {
                        //This is called when the user selects an item.
                        setState(() {
                          orientation = value!;
                          icon: const Icon(Icons.arrow_downward);
                          underline: Container(height: 2,color: Colors.blueGrey
                          );
                        });
                      },
                      items: paperOrientation.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value));
                    }).toList(), ),
                  ),
                ),
              ],
            ),
            //No staplers
            Row(
              children: [
                Padding(
                  //alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Text('Staplers'),
                  // child: TextField(
                  //   //controller: paperSize,
                  // decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  // labelText: 'Staplers',
                  // prefixIcon: Icon(Icons.pages),
                  //   ),
                  // ),
                ),
                //Dropdown list
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton <String>(
                      value: staplers,
                      isExpanded: true,
                      onChanged: (String? value) {
                        //This is called when the user selects an item.
                        setState(() {
                          staplers = value!;
                          icon: const Icon(Icons.arrow_downward);
                          underline: Container(height: 2,color: Colors.blueGrey
                          );
                        });
                      },
                      items: staplersrsOrNot.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value));
                    }).toList(), ),
                  ),
                ),
              ],
            ),
            //Sorted
            Row(
              children: [
                Padding(
                  //alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Text('Sorted'),
                  // child: TextField(
                  //   //controller: paperSize,
                  // decoration: const InputDecoration(
                  // border: OutlineInputBorder(),
                  // labelText: 'Sorted',
                  // prefixIcon: Icon(Icons.pages),
                  //   ),
                  // ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownButton <String>(
                      value: sorted,
                      isExpanded: true,
                      onChanged: (String? value) {
                        //This is called when the user selects an item.
                        setState(() {
                          sorted = value!;
                          icon: const Icon(Icons.arrow_downward);
                          underline: Container(height: 2,color: Colors.blueGrey
                          );
                        });
                      },
                      items: sortedOrNot.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value));
                    }).toList(), ),
                  ),
                ),
              ],
            ),
            //Pages per sheet
            Padding(
              //alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: TextField(
                //controller: paperSize,
              decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Pages per sheet',
              prefixIcon: Icon(Icons.pages),
                ),
              ),
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
      'service': service.toString(),
      'paperSize': paperSize.toString(),
      'price': price.text,
      'set': set.text,
      'collectDate': collectDate.text,
      'notes': notes.text,
      'colourMode': _character.toString(),
    };
  }
}
