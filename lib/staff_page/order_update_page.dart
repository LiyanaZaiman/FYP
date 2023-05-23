import 'package:flutter/material.dart';

import '../../controllers/main_controller.dart';
import '../../di/service_locator.dart';
import 'customer_records_page.dart';
import 'order_records_page.dart';

const List<String> orderStatus = <String>['Pending Approval', 'To Print', 'To Receive', 'Completed'];

class OrderUpdate extends StatefulWidget {
  const OrderUpdate({
    super.key,
    required this.orderId,
    required this.customerId,
    required this.staffId,
    required this.productId,
    required this.uploadedFiles,
    required this.printingType,
    required this.paperOrientation,
    required this.staplers,
    required this.sorted,
    required this.pagesPerSheet,
    required this.orderDatumSet,
    required this.orderDate,
    required this.orderTime,
    required this.collectDate,
    required this.notes,
    required this.price,
    required this.receipt,
    required this.status,
  });

  final String orderId;
  final String customerId;
  final String staffId;
  final String productId;
  final String uploadedFiles;
  final String printingType;
  final String paperOrientation;
  final String staplers;
  final String sorted;
  final String pagesPerSheet;
  final String orderDatumSet;
  final String orderDate;
  final String orderTime;
  final String collectDate;
  final String notes;
  final String price;
  final String receipt;
  final String status;

  @override
  State<OrderUpdate> createState() => _OrderUpdateState();
}

final orderId = TextEditingController();
final customerId = TextEditingController();
final staffId = TextEditingController();
final productId = TextEditingController();
final uploadedFiles = TextEditingController();
final printingType = TextEditingController();
final paperOrientation = TextEditingController();
final staplers = TextEditingController();
final sorted = TextEditingController();
final pagePerSheet = TextEditingController();
final orderDatumSet = TextEditingController();
final orderDate = TextEditingController();
final orderTime = TextEditingController();
final collectDate = TextEditingController();
final notes = TextEditingController();
final price = TextEditingController();
final receipt = TextEditingController();
var status = TextEditingController();
final mainController = getIt<MainController>();

class _OrderUpdateState extends State<OrderUpdate> {
  @override
  Widget build(BuildContext context) {
    orderId.text = widget.orderId;
    customerId.text = widget.customerId;
    staffId.text = widget.staffId;
    productId.text = widget.productId;
    uploadedFiles.text = widget.uploadedFiles;
    printingType.text = widget.printingType;
    paperOrientation.text = widget.paperOrientation;
    staplers.text = widget.staplers;
    sorted.text = widget.sorted;
    pagePerSheet.text = widget.pagesPerSheet;
    orderDatumSet.text = widget.orderDatumSet;
    orderDate.text = widget.orderDate;
    orderTime.text = widget.orderTime;
    collectDate.text = widget.collectDate;
    notes.text = widget.notes;
    price.text = widget.price;
    receipt.text = widget.receipt;
    status.text = widget.status;

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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: customerId,
                        decoration: InputDecoration(
                          label: Text("Customer ID"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: staffId,
                        decoration: InputDecoration(
                          label: Text("Staff ID"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: productId,
                        decoration: InputDecoration(
                          label: Text("Product ID"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: printingType,
                        decoration: InputDecoration(
                          label: Text("Printing Type"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: paperOrientation,
                        decoration: InputDecoration(
                          label: Text("Paper Orientation"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: staplers,
                        decoration: InputDecoration(
                          label: Text("Staplers"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: sorted,
                        decoration: InputDecoration(
                          label: Text("Sorted"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: pagePerSheet,
                        decoration: InputDecoration(
                          label: Text("Pages per Sheet"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: orderDatumSet,
                        decoration: InputDecoration(
                          label: Text("Set"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: orderTime,
                        decoration: InputDecoration(
                          label: Text("Order Time"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: orderDate,
                        decoration: InputDecoration(
                          label: Text("Order Date",),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: collectDate,
                        decoration: InputDecoration(
                          label: Text("Collection Date"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: notes,
                        decoration: InputDecoration(
                          label: Text("Notes"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: price,
                        decoration: InputDecoration(
                          label: Text("Total Amount"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: receipt,
                        decoration: InputDecoration(
                          label: Text("Receipt"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextField(
                    //     controller: status,
                    //     decoration: InputDecoration(
                    //       label: Text("Status"),
                    //       border: OutlineInputBorder(),
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        Padding(
                                    //alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10),
                                    child: Text('Order Status'),
                                  ),
                                  Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownButton<String>(
                                    value:
                                        status.toString(),
                                    isExpanded: true,
                                    onChanged: (String? value) {
                                      //This is called when the user selects an item.
                                      setState(() {
                                       status =
                                            value! as TextEditingController;
                                        icon:
                                        const Icon(Icons.arrow_downward);
                                        underline:
                                        Container(
                                            height: 2, color: Colors.blueGrey);
                                      });
                                    },
                                    items: orderStatus
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem(
                                          value: value, child: Text(value));
                                    }).toList(),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    //Dropdown list
                              
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          mainController.updateOrder(
                            context,
                            orderId.text,
                            customerId.text,
                            staffId.text,
                            productId.text,
                            uploadedFiles.text,
                            printingType.text,
                            paperOrientation.text,
                            staplers.text,
                            sorted.text,
                            pagePerSheet.text,
                            orderDatumSet.text,
                            orderDate.text,
                            orderTime.text,
                            collectDate.text,
                            notes.text,
                            price.text,
                            receipt.text,
                            status.text,
                          );
                        },
                        child: Text("Update")),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          mainController.deleteCustomer(
                            context,
                            customerId.text,
                          );
                        },
                        child: Text("Delete")),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
