import 'dart:io';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../controllers/order_controller.dart';
import '../../di/service_locator.dart';
import 'order_records_page.dart';

class InsertOrder extends StatefulWidget {
  const InsertOrder({super.key});

  @override
  State<InsertOrder> createState() => _InsertOrderState();
}

class _InsertOrderState extends State<InsertOrder> {
  FilePickerResult? result;
  File? fileUp;
  String? price;
  double totalAmount = 0;
  final orderController = getIt<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderRecordsPage(),
                  ));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // TextField(
                    //   controller: productId,
                    //   decoration: InputDecoration(
                    //     label: Text("Product ID"),
                    //   ),
                    // ),
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
                                child: Text("Choose File"))),
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
                        if (result == null)
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.4)),
                              ),
                              child: Text(
                                'No file chosen',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //controller: orderController.printingServiceController,
                        decoration: InputDecoration(
                          label: Text("Type of Service"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //controller: signinController.staffPhoneController,
                        decoration: InputDecoration(
                          label: Text("Paper Size"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //controller: signinController.staffEmailController,
                        decoration: InputDecoration(
                          label: Text("Colour Mode"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //controller: signinController.staffPasswordController,
                        decoration: InputDecoration(
                          label: Text("Print One Sided"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //controller: signinController.staffPasswordController,
                        decoration: InputDecoration(
                          label: Text("Paper Orientation"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //controller: signinController.staffPasswordController,
                        decoration: InputDecoration(
                          label: Text("Stapler"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //controller: signinController.staffPasswordController,
                        decoration: InputDecoration(
                          label: Text("Sorted"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: orderController.setController,
                        decoration: InputDecoration(
                          label: Text("Number of Set"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: orderController.sheetController,
                        decoration: InputDecoration(
                          label: Text("Pages per Sheet"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: orderController.collectDateController,
                        decoration: InputDecoration(
                          label: Text("Collection Date"),
                          border: OutlineInputBorder(),
                        ),
                        onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        DateTime.now(), //get today's date
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(pickedDate);
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(formattedDate);
                                  setState(() {
                                    orderController.collectDateController.text =
                                        formattedDate;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: orderController.notesController,
                        decoration: InputDecoration(
                          label: Text("Notes (optional)"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    //Price
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 56,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.money),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Price : RM " + price!,
                                  style: TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    // orderController.order(fileUp!, context, totalAmount);
                  },
                  child: Text("Add")),
            ),
          ],
        ),
      ),
    );
  }
}
