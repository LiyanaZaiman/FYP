import 'package:flutter/material.dart';

import '../../controllers/main_controller.dart';
import '../../di/service_locator.dart';
import 'customer_records_page.dart';
import 'product_records_page.dart';

class InsertProduct extends StatefulWidget {
  const InsertProduct({
    super.key,
  });
  @override
  State<InsertProduct> createState() => _InsertProductState();
}


class _InsertProductState extends State<InsertProduct> {
  final mainController = getIt<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductRecordsPage(),
                  ));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // TextField(
                  //   controller: productId,
                  //   decoration: InputDecoration(
                  //     label: Text("Product ID"),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: mainController.productnameController,
                      decoration: InputDecoration(
                        label: Text("Product Name"),
                        border: OutlineInputBorder(),
                        //prefixIcon: Icon(Icons.pages),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: mainController.descriptionController,
                      decoration: InputDecoration(
                        label: Text("Description"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: mainController.priceController,
                      decoration: InputDecoration(
                        label: Text("Price"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: mainController.paperSizeController,
                      decoration: InputDecoration(
                        label: Text("Paper Size"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: mainController.colourModeController,
                      decoration: InputDecoration(
                        label: Text("Colour Mode"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: mainController.sidedController,
                      decoration: InputDecoration(
                        label: Text("Sided"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50)
              ),
                onPressed: () {
                  mainController.addProduct(
                    context,
                  );
                },
                child: Text("Add")),
          ],
        ),
      ),
    );
  }
}
