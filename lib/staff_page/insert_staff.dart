import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:online_printing_service/view/staff_page/staff_records_page.dart';

import '../../controllers/sign_in_controller.dart';
import '../../di/service_locator.dart';

class InsertStaff extends StatefulWidget {
  const InsertStaff({super.key});

  @override
  State<InsertStaff> createState() => _InsertStaffState();
}

class _InsertStaffState extends State<InsertStaff> {
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
                    builder: (context) => StaffRecords(),
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
                        controller: signinController.staffnameController,
                        decoration: InputDecoration(
                          label: Text("Staff Name"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.staffGenderController,
                        decoration: InputDecoration(
                          label: Text("Gender"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.staffPhoneController,
                        decoration: InputDecoration(
                          label: Text("Phone Number"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.staffEmailController,
                        decoration: InputDecoration(
                          label: Text("Email"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: signinController.staffPasswordController,
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
                    signinController.staffRegister(context);
                  },
                  child: Text("Add")),
            ),
          ],
        ),
      ),
    );
  }
}