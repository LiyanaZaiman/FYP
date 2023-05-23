import 'package:flutter/material.dart';
import '../../controllers/main_controller.dart';
import '../../controllers/sign_in_controller.dart';
import '../../di/service_locator.dart';
import '../sign_in/signup.dart';
import '../widgets/form_error.dart';

class StaffSignInPage extends StatefulWidget {
  const StaffSignInPage({super.key});

  @override
  State<StaffSignInPage> createState() => _StaffSignInPage();
}

final signInController = getIt<SignInController>();
final navigatorKey = GlobalKey<NavigatorState>();

class _StaffSignInPage extends State<StaffSignInPage> {
  final List<String?> errors = [];
final mainController = getIt<MainController>();
  GlobalKey<FormState> signInKey =
      GlobalKey<FormState>(debugLabel: 'GlobalFormKey #toSignIn ');

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
      // extendBodyBehindAppBar: false,
      // appBar: AppBar(
      //   //Start here
      //   iconTheme: const IconThemeData(color: Colors.blue),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: const Text(
      //     'Online Printing Service',
      //     style: TextStyle(
      //       color: Color(0xFF077bd7),
      //       fontSize: 23.5,
      //       fontFamily: 'Raleway',
      //       fontWeight: FontWeight.w900,
      //       letterSpacing: 3,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white60,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: 700,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Admin Login',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Form(
                      key: signInKey,
                      child: Column(
                        children: [
                          //Username
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required.";
                                }
                                return null;
                              },
                              controller: signInController.emailStaffController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          //password
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required.";
                                }
                                return null;
                              },
                              obscureText: true,
                              controller:
                                  signInController.passwordStaffController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          FormError(
                            errors: errors,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal)),
                        onPressed: () {
                          if (signInKey.currentState!.validate()) {
                                  signInController.loginStaff(context);
                                } else {
                                  mainController.showFieldAlert(context);
                                }
                          
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Does not have account?'),
                        TextButton(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
