import 'package:flutter/material.dart';
import 'package:online_printing_service/controllers/view_controller.dart';
import 'package:online_printing_service/view/staff_page/admin_menu_drawer.dart';

import '../../data/models/customer_data_model.dart';
import '../../di/service_locator.dart';
import 'customer_update_page.dart';
import 'insert_customer_page.dart';

class CustomerRecordsPage extends StatefulWidget {
  const CustomerRecordsPage({super.key});

  @override
  State<CustomerRecordsPage> createState() => _CustomerRecordsPageState();
}

class _CustomerRecordsPageState extends State<CustomerRecordsPage> {
  final viewCustomer = getIt<ViewController>();
  final searchController = TextEditingController();
  String searchValue = "";
  late Future<Customer> future;

  @override
  void initState() {
    future = viewCustomer.viewCustomer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Records"),
        //leading: MenuDrawer(),
      ),
      drawer: AdminMenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "List of Customer",
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
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.customerData
                            .length, //return the item(number of data/row) length
                        itemBuilder: (context, index) {
                          final custData = snapshot.data!.customerData;
                          return custData[index].name.contains(searchValue) ||
                                  custData[index].customerId.contains(searchValue) ||
                                  custData[index].email.contains(searchValue) ||
                                  custData[index].gender.contains(searchValue)
                              ? InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomerUpdate(
                                                  customerId: custData[index]
                                                      .customerId,
                                                  name: custData[index].name,
                                                  gender:
                                                      custData[index].gender,
                                                  phone: custData[index].phone,
                                                  email: custData[index].email,
                                                  addressline1: custData[index]
                                                      .addressline1,
                                                  addressline2: custData[index]
                                                      .addressline2,
                                                  postcode:
                                                      custData[index].postcode,
                                                  state: custData[index].state,
                                                  password:
                                                      custData[index].password,
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
                                              color: Color.fromARGB(
                                                  172, 209, 206, 206),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text("Customer ID:"),
                                                    Text(
                                                      custData[index]
                                                          .customerId,
                                                      style: TextStyle(
                                                        fontSize: 50,
                                                        fontWeight:
                                                            FontWeight.w200,
                                                      ),
                                                    ),
                                                    Text(
                                                      custData[index].name,
                                                    ),
                                                  ]),
                                            )),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                //Text(custData[index].gender),
                                                Text(custData[index].email),
                                                Text(custData[index].phone),
                                                Divider(
                                                  color: Colors.grey,
                                                  thickness: 2,
                                                ),
                                                Text(custData[index]
                                                    .addressline1),
                                                Text(custData[index]
                                                    .addressline2),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Text(
                                                          custData[index]
                                                              .postcode),
                                                    ),
                                                    Text(custData[index].state),
                                                  ],
                                                ),
                                              ],
                                            ),
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
              //Example of looping using Listview builder
              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: 2,
              //   itemBuilder:(context, index) {
              //   return Text("data");
              // },
              // ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InsertCustomer()));
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
