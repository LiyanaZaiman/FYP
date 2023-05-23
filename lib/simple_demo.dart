import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../controllers/main_controller.dart';
import '../di/service_locator.dart';

class SimpleDemo extends StatefulWidget {
  const SimpleDemo({super.key});

  @override
  State<SimpleDemo> createState() => _SimpleDemoState();
}
final mainController = getIt<MainController>();

class _SimpleDemoState extends State<SimpleDemo> {
  FilePickerResult? result;
  File? fileUp;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("File picker demo"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (result != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selected file:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: result?.files.length ?? 0,
                        itemBuilder: (context, index) {
                          return Text(result?.files[index].name ?? '',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold));
                        })
                  ],
                ),
              ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  result = await FilePicker.platform.pickFiles();
                  if (result != null) {
                    File file = File(result!.files.single.path!);
                    setState(() {
                     fileUp = file;
                    });
                  }
                  // result =
                  //     await FilePicker.platform.pickFiles(allowMultiple: false);
                  // if (result == null) {
                  //   print("No file selected");
                  // } else {
                  //   setState(() {
                  //     result?.files;
                  //   });
                  //   result?.files.forEach((element) {
                  //     print("file name here bosku${element.name}");
                  //     print("file path here nasri${element.path!}");
                  //   });
                  // }
                },
                child: const Text("File Picker"),
              ),
            ),
            //IMPORTANT!! This is where you upload file to the database'
            //Put this in the order button!
            Center(
              child: ElevatedButton (
                onPressed: () async {
                  if(fileUp != null){
                    mainController.demo(context, fileUp!);
                  }else{
                    print("No file");
                  };
                },
                child: const Text("Upload File"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}