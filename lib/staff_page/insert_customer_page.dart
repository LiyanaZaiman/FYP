import 'package:flutter/material.dart';
import 'package:online_printing_service/view/sign_in/register_page.dart';
import '../../controllers/sign_in_controller.dart';
import '../../di/service_locator.dart';
import 'customer_records_page.dart';

class InsertCustomer extends StatefulWidget {
  const InsertCustomer({super.key});

  @override
  State<InsertCustomer> createState() => _InsertCustomerState();
}

class _InsertCustomerState extends State<InsertCustomer> {
  final signinController = getIt<SignInController>();
  @override
  Widget build(BuildContext context) {
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
                        controller: signinController.nameController,
                        decoration: InputDecoration(
                          label: Text("Customer Name"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.genderController,
                        decoration: InputDecoration(
                          label: Text("Gender"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.phoneController,
                        decoration: InputDecoration(
                          label: Text("Phone Number"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.emailController,
                        decoration: InputDecoration(
                          label: Text("Email"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.addressline1Controller,
                        decoration: InputDecoration(
                          label: Text("Address Line 1"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.addressline2Controller,
                        decoration: InputDecoration(
                          label: Text("Address Line 2"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.postcodeController,
                        decoration: InputDecoration(
                          label: Text("Postcode"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.stateController,
                        decoration: InputDecoration(
                          label: Text("State"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.passwordSignupController,
                        decoration: InputDecoration(
                          label: Text("Password"),
                          border: OutlineInputBorder(),
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
                    signinController.register(context);
                  },
                  child: Text("Add")),
            ),
          ],
        ),
      ),
    );
  }
}