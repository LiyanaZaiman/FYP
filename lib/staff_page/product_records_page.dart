import 'package:flutter/material.dart';
import 'package:online_printing_service/controllers/view_controller.dart';
import 'package:online_printing_service/di/service_locator.dart';
import 'package:online_printing_service/view/staff_page/admin_menu_drawer.dart';
import 'package:online_printing_service/view/staff_page/insert_product_page.dart';
import 'package:online_printing_service/view/staff_page/product_update_page.dart';

import '../../data/models/product_data_model.dart';

class ProductRecordsPage extends StatefulWidget {
  const ProductRecordsPage({super.key});

  @override
  State<ProductRecordsPage> createState() => _ProductRecordsPageState();
}

class _ProductRecordsPageState extends State<ProductRecordsPage> {
  final viewProducts = getIt<ViewController>();
  final searchController = TextEditingController();
  String searchValue = "";
  late Future<Product> future;

  @override
  void initState() {
    future = viewProducts.viewProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Records"),
        //leading: MenuDrawer(),
      ),
      drawer: AdminMenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "List of Product",
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
                        borderRadius: BorderRadius.circular(14) ),
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
                        physics:
                            NeverScrollableScrollPhysics(), //Listview builder is scrollable by default, Widget tree have SingleChildScrollView() so need to switch of either one
                        itemCount: snapshot.data!.productData
                            .length, //return the item(number of data/row) length
                        itemBuilder: (context, index) {
                          final productData = snapshot.data!.productData;
                          return 
                          productData[index].name.contains(searchValue) ||
                          productData[index].description.contains(searchValue) ||
                          productData[index].productId.contains(searchValue) ||
                          productData[index].price.contains(searchValue)?
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductUpdate(
                                            productId:
                                                productData[index].productId,
                                            name: productData[index].name,
                                            description:
                                                productData[index].description,
                                            price: productData[index].price,
                                            paperSize:
                                                productData[index].paperSize,
                                            colourMode:
                                                productData[index].colourMode,
                                            sided: productData[index].sided,
                                          )));
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
                                        color:
                                            Color.fromARGB(172, 209, 206, 206),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Product ID:"),
                                              Text(
                                                productData[index].productId,
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w200,
                                                ),
                                              ),
                                            ]),
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            //productData[index].name,
                                            productData[index].description,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(productData[index].paperSize),
                                          Text(productData[index].colourMode),
                                          Text(productData[index].sided),
                                          Divider(
                                            color: Colors.black12,
                                            thickness: 2,
                                          ),
                                          Text(
                                            "RM " +
                                                double.parse(productData[index]
                                                        .price)
                                                    .toStringAsFixed(2),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ): Container(); //data ada index
                        },
                      );
                    }
                    return Container();
                  }),
              //       ElevatedButton.icon(
              //   icon: const Icon(Icons.plus_one),
              //   label: Text('Add '),
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => ProductRecordsPage()));
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
                      MaterialPageRoute(builder: (context) => InsertProduct()));
                },
                label: const Text('Add'),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
