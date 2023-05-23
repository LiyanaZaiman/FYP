import 'package:flutter/material.dart';

import '../../controllers/main_controller.dart';
import '../../di/service_locator.dart';
import 'customer_records_page.dart';

class CustomerUpdate extends StatefulWidget {
  const CustomerUpdate({
    super.key,
    required this.customerId,
    required this.name,
    required this.gender,
    required this.phone,
    required this.email,
    required this.addressline1,
    required this.addressline2,
    required this.postcode,
    required this.state,
    required this.password,
  });

  final String customerId;
  final String name;
  final String gender;
  final String phone;
  final String email;
  final String addressline1;
  final String addressline2;
  final String postcode;
  final String state;
  final String password;
  @override
  State<CustomerUpdate> createState() => _CustomerUpdateState();
}

final customerId = TextEditingController();
final name = TextEditingController();
final gender = TextEditingController();
final phone = TextEditingController();
final email = TextEditingController();
final addressline1 = TextEditingController();
final addressline2 = TextEditingController();
final postcode = TextEditingController();
final state = TextEditingController();
final password = TextEditingController();
final mainController = getIt<MainController>();

class _CustomerUpdateState extends State<CustomerUpdate> {
  @override
  Widget build(BuildContext context) {
    customerId.text = widget.customerId;
    name.text = widget.name;
    gender.text = widget.gender;
    phone.text = widget.phone;
    email.text = widget.email;
    addressline1.text = widget.addressline1;
    addressline2.text = widget.addressline2;
    postcode.text = widget.postcode;
    state.text = widget.state;
    password.text = widget.password;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerRecordsPage(),
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
                          label: Text("Customer Name"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: gender,
                        decoration: InputDecoration(
                          label: Text("Gender"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: phone,
                        decoration: InputDecoration(
                          label: Text("Phone Number"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          label: Text("Email"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: addressline1,
                        decoration: InputDecoration(
                          label: Text("Address Line 1"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: addressline2,
                        decoration: InputDecoration(
                          label: Text("Address Line 2"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: postcode,
                        decoration: InputDecoration(
                          label: Text("Postcode"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: state,
                        decoration: InputDecoration(
                          label: Text("State"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
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
                          mainController.updateCustomer(
                            context,
                            customerId.text,
                            name.text,
                            gender.text,
                            phone.text,
                            email.text,
                            addressline1.text,
                            addressline2.text,
                            postcode.text,
                            state.text,
                            password.text,
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
