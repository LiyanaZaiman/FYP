import 'package:flutter/material.dart';
import 'package:online_printing_service/view/simple_demo.dart';
import 'package:online_printing_service/view/staff_page/product_records_page.dart';

import '../../controllers/main_controller.dart';
import '../../di/service_locator.dart';

class ProductUpdate extends StatefulWidget {
  const ProductUpdate(
      {super.key,
      required this.productId,
      required this.name,
      required this.description,
      required this.price,
      required this.paperSize,
      required this.colourMode,
      required this.sided});

  final String productId;
  final String name;
  final String description;
  final String price;
  final String paperSize;
  final String colourMode;
  final String sided;

  @override
  State<ProductUpdate> createState() => _ProductUpdateState();
}

final productId = TextEditingController();
final name = TextEditingController();
final description = TextEditingController();
final price = TextEditingController();
final paperSize = TextEditingController();
final colourMode = TextEditingController();
final sided = TextEditingController();
final mainInController = getIt<MainController>();

class _ProductUpdateState extends State<ProductUpdate> {
  @override
  Widget build(BuildContext context) {
    productId.text = widget.productId;
    name.text = widget.name;
    description.text = widget.description;
    price.text = widget.price;
    paperSize.text = widget.paperSize;
    colourMode.text = widget.colourMode;
    sided.text = widget.sided;

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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                          label: Text("Product Name"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: description,
                        decoration: InputDecoration(
                          label: Text("Description"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: price,
                        decoration: InputDecoration(
                          label: Text("Product Price"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: colourMode,
                        decoration: InputDecoration(
                          label: Text("Colour Mode"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: sided,
                        decoration: InputDecoration(
                          label: Text("Sided"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            mainController.updateProduct(
                                context,
                                productId.text,
                                name.text,
                                description.text,
                                price.text,
                                paperSize.text,
                                colourMode.text,
                                sided.text);
                          },
                          child: Text("Update")),
                    ),
                  ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                          onPressed: () {
                            mainController..deleteProduct(
                                context,
                                productId.text,);
                          },
                          child: Text("Delete")),
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
