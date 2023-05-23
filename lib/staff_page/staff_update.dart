import 'package:flutter/material.dart';
import 'package:online_printing_service/view/staff_page/staff_records_page.dart';
import '../../controllers/main_controller.dart';
import '../../di/service_locator.dart';

class StaffUpdate extends StatefulWidget {
  const StaffUpdate({super.key,required this.staffId,
        required this.name,
        required this.phoneNumber,
        required this.email,
        required this.gender,
        required this.password,});

    final String staffId;
    final String name;
    final String phoneNumber;
    final String email;
    final String gender;
    final String password;

  @override
  State<StaffUpdate> createState() => _StaffUpdateState();
}

final staffId = TextEditingController();
final name = TextEditingController();
final phone = TextEditingController();
final email = TextEditingController();
final gender = TextEditingController();
final password = TextEditingController();
final mainController = getIt<MainController>();

class _StaffUpdateState extends State<StaffUpdate> {
  @override
  Widget build(BuildContext context) {
    staffId.text = widget.staffId;
    name.text = widget.name;
    gender.text = widget.gender;
    phone.text = widget.phoneNumber;
    email.text = widget.email;
    password.text = widget.password;
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
                        controller: name,
                        decoration: InputDecoration(
                          label: Text("Staff Name"),
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
                        controller: password,
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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          mainController.updateStaff(
                            context,
                            staffId.text,
                            name.text,
                            gender.text,
                            phone.text,
                            email.text,
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
                          mainController.deleteStaff(
                            context,
                            staffId.text,
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