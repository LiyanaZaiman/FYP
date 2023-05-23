import 'package:flutter/material.dart';
import 'package:online_printing_service/view/sign_in/signup.dart';
import '../../controllers/main_controller.dart';
import '../../controllers/sign_in_controller.dart';
import '../../di/service_locator.dart';
import '../widgets/form_error.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

final signInController = getIt<SignInController>();

class _SignInPageState extends State<SignInPage> {
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
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white60,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Customer Login',
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
                          //email
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "*Required.";
                                }
                                return null;
                              },
                              controller:
                                  signInController.emailCustomerController,
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
                              controller: signInController.passwordController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          FormError(
                            errors: errors,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal)),
                              onPressed: () {
                                
                                if (signInKey.currentState!.validate()) {
                                  signInController.login(context);
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
                                          builder: (context) =>
                                              const SignupPage()));
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
