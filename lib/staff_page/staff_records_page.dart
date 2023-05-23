import 'package:flutter/material.dart';
import 'package:online_printing_service/controllers/view_controller.dart';
import 'package:online_printing_service/view/staff_page/admin_menu_drawer.dart';
import 'package:online_printing_service/view/staff_page/staff_update.dart';

import '../../data/models/staff_data_model.dart';
import '../../di/service_locator.dart';
import 'insert_staff.dart';

class StaffRecords extends StatefulWidget {
  const StaffRecords({super.key});

  @override
  State<StaffRecords> createState() => _StaffRecordsState();
}

class _StaffRecordsState extends State<StaffRecords> {
  final viewStaff = getIt<ViewController>();
  final searchController = TextEditingController();
  String searchValue = "";
  late Future<Staff> future;

  @override
  void initState() {
    future = viewStaff.viewStaff();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staff Records"),
        //leading: MenuDrawer(),
      ),
      drawer: AdminMenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "List of Staff",
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
                        itemCount: snapshot.data!.staffData
                            .length, //return the item(number of data/row) length
                        itemBuilder: (context, index) {
                          final staffData = snapshot.data!.staffData;
                          return 
                          staffData[index].staffId.contains(searchValue) ||
                          staffData[index].name.contains(searchValue) ||
                          staffData[index].email.contains(searchValue) ||
                          staffData[index].phoneNumber.contains(searchValue) ||
                          staffData[index].gender.contains(searchValue)
                          ?
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StaffUpdate(
                                            staffId: staffData[index].staffId,
                                            name: staffData[index].name,
                                            gender: staffData[index].gender,
                                            phoneNumber:
                                                staffData[index].phoneNumber,
                                            email: staffData[index].email,
                                            password: staffData[index].password,
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
                                            Text("Staff ID:"),
                                            Text(
                                              staffData[index].staffId,
                                              style: TextStyle(
                                                fontSize: 50,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                            Text(
                                              staffData[index].name,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(staffData[index].phoneNumber),
                                          Text(staffData[index].email),
                                          Divider(
                                            color: Colors.black12,
                                            thickness: 2,
                                          ),
                                          Text(staffData[index].gender),
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
              FloatingActionButton.extended(
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => InsertStaff()));
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
