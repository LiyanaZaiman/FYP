import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_printing_service/controllers/view_controller.dart';
import 'package:online_printing_service/view/staff_page/order_update_page.dart';

import '../../data/models/order_data_model.dart';
import '../../di/service_locator.dart';
import 'admin_menu_drawer.dart';
import 'insert_order.dart';

class OrderRecordsPage extends StatefulWidget {
  const OrderRecordsPage({super.key});

  @override
  State<OrderRecordsPage> createState() => _OrderRecordsPageState();
}

class _OrderRecordsPageState extends State<OrderRecordsPage> {
  final viewOrder = getIt<ViewController>();
  final searchController = TextEditingController();
  String searchValue = "";
  late Future<Order> future;

  @override
  void initState() {
    future = viewOrder.viewOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Records"),
        //leading: MenuDrawer(),
      ),
      drawer: AdminMenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              "List of Order",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)),
                    labelText: "Search",
                    isDense: true,
                    contentPadding: EdgeInsets.all(8)),
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchValue = value;
                  });
                },
              ),
            ),
            FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    final error = snapshot.error;
                    print(error);
                    return const Center(child: Text('Error'));
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.orderData
                          .length, //return the item(number of data/row) length
                      itemBuilder: (context, index) {
                        final orderData = snapshot.data!.orderData;
                        return orderData[index].orderId.contains(searchValue) ||
                                orderData[index]
                                    .printingType
                                    .contains(searchValue)
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderUpdate(
                                              orderId: orderData[index].orderId,
                                              customerId:
                                                  orderData[index].customerId,
                                              staffId: orderData[index].staffId,
                                              productId:
                                                  orderData[index].productId,
                                              uploadedFiles: orderData[index]
                                                  .uploadedFiles,
                                              printingType:
                                                  orderData[index].printingType,
                                              paperOrientation: orderData[index]
                                                  .paperOrientation,
                                              staplers:
                                                  orderData[index].staplers,
                                              sorted: orderData[index].sorted,
                                              pagesPerSheet: orderData[index]
                                                  .pagesPerSheet,
                                              orderDatumSet: orderData[index]
                                                  .orderDatumSet,
                                              orderDate: DateFormat('yyyy-MM-dd')
                                                  .format(orderData[index]
                                                      .orderDate),
                                              orderTime:
                                                  orderData[index].orderTime,
                                              collectDate: DateFormat('yyyy-MM-dd')
                                                  .format(orderData[index]
                                                      .collectDate),
                                              notes: orderData[index].notes,
                                              price: orderData[index].price,
                                              receipt: orderData[index].receipt,
                                              status: orderData[index].status)));
                                },
                                child: Card(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 110,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Color.fromARGB(
                                              172, 209, 206, 206),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text('Order ID:'),
                                              Text(
                                                orderData[index].orderId,
                                                style: TextStyle(
                                                  fontSize: 50,
                                                  fontWeight: FontWeight.w200,
                                                ),
                                              ),
                                              Text(
                                                "RM" +
                                                    double.parse(
                                                            orderData[index]
                                                                .price)
                                                        .toStringAsFixed(2),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Text(orderData[index].customerId),
                                            // Text(orderData[index].staffId),
                                            Text(orderData[index].productId),
                                            // Text(orderData[index].uploadedFiles),
                                            Text(orderData[index].printingType),
                                            Text(orderData[index]
                                                .paperOrientation),
                                            Text(orderData[index].staplers),
                                            Text(orderData[index].sorted),
                                            Text(
                                                orderData[index].pagesPerSheet),
                                            // Text(orderData[index]
                                            //     .orderDatumSet
                                            //     .toString()),
                                            // Text(orderData[index].orderTime.toString()),
                                            Text(DateFormat('yyyy-MM-dd')
                                                  .format(orderData[index]
                                                      .collectDate)),
                                            // Text(orderData[index].notes),
                                            // Text(orderData[index].receipt),
                                            Text(
                                              orderData[index].status,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(); //data ada index
                      },
                    );
                  }
                  return Container();
                }),
            //     ElevatedButton.icon(
            //   icon: const Icon(Icons.plus_one),
            //   label: Text('Add '),
            //   onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => OrderRecordsPage()));
            //   },
            //   style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.white,
            //       foregroundColor: Colors.black,
            //       minimumSize: Size(double.infinity, 40),
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //       textStyle: const TextStyle(
            //           fontSize: 20, fontWeight: FontWeight.normal)),
            // ),
            FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => InsertOrder()));
              },
              label: const Text('Add'),
              icon: const Icon(Icons.add),
            ),
          ]),
        ),
      ),
    );
  }
}
