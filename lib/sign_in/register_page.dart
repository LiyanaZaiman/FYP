import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:online_printing_service/view/sign_in/login.dart';
import 'package:online_printing_service/view/sign_in/sign_in_page.dart';

import '../../controllers/main_controller.dart';
import '../../controllers/sign_in_controller.dart';
import '../../di/service_locator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final signInController = getIt<SignInController>();

class _RegisterPageState extends State<RegisterPage> {
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
                'Customer Registration',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Form(
                key: signUpKey,
                child: Column(children: [
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
                      controller: signInController.nameController,
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
                      controller: signInController.genderController,
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
                      controller: signInController.phoneController,
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
                      controller: signInController.emailController,
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
                        label: Text("Address Line 1"),
                        border: OutlineInputBorder(),
                      ),
                      controller: signInController.addressline1Controller,
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
                        label: Text("Address Line 2"),
                        border: OutlineInputBorder(),
                      ),
                      controller: signInController.addressline2Controller,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text("Postcode"),
                        border: OutlineInputBorder(),
                      ),
                      controller: signInController.postcodeController,
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
                        label: Text("State"),
                        border: OutlineInputBorder(),
                      ),
                      controller: signInController.stateController,
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
                      controller: signInController.passwordSignupController,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (signUpKey.currentState!.validate()) {
                          signInController.register(context);
                        } else {
                          mainController.showFieldAlert(context);
                        }
                      },
                      child: Text("Register"))
                ])),
          ],
        ),
      ),
    ));
  }
}
