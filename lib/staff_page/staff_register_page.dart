import 'package:flutter/material.dart';

import '../../controllers/main_controller.dart';
import '../../controllers/sign_in_controller.dart';
import '../../di/service_locator.dart';
import '../widgets/form_error.dart';

class StaffRegisterPage extends StatefulWidget {
  const StaffRegisterPage({super.key});

  @override
  State<StaffRegisterPage> createState() => _StaffRegisterPageState();
}

final signInController = getIt<SignInController>();

class _StaffRegisterPageState extends State<StaffRegisterPage> {
  final List<String?> errors = [];
  final mainController = getIt<MainController>();
  GlobalKey<FormState> signUpKey =
      GlobalKey<FormState>(debugLabel: 'GlobalFormKey #toSignUp ');

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar:AppBar(
        //   title: IconButton(
        //   icon: Icon(Icons.arrow_left),
        //   onPressed: () {
        //     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => const LoginSignup()));
        //   },
        // ),
        // ),
        body: SingleChildScrollView(
      child: Card(
        color: Colors.white60,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Staff Registration',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Form(
              key: signUpKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*Required.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text("Name"),
                        border: OutlineInputBorder(),
                      ),
                      controller: signInController.staffnameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*Required.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text("Phone"),
                        border: OutlineInputBorder(),
                      ),
                      controller: signInController.staffPhoneController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*Required.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text("Email"),
                        border: OutlineInputBorder(),
                      ),
                      controller: signInController.staffEmailController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*Required.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text("Gender"),
                        border: OutlineInputBorder(),
                      ),
                      controller: signInController.staffGenderController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "*Required.";
                          
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        border: OutlineInputBorder(),
                      ),
                      controller: signInController.staffPasswordController,
                    ),
                  ),
                  FormError(
                    errors: errors,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (signUpKey.currentState!.validate()) {
                    signInController.staffRegister(context);
                  } else {
                    mainController.showFieldAlert(context);
                  }
                },
                child: Text("Register"))
          ],
        ),
      ),
    ));
  }
}
