import 'dart:async';

import 'package:clinic/widgets/custom_button.dart';
import 'package:clinic/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _MyWidgetState();
}

final GlobalKey<FormState> _formstate = GlobalKey<FormState>();
AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

String? username;
String? pass;
String username1 = "issa";
String pass1 = "issa";

class _MyWidgetState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 189, 213),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Wellcome To Clinic",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'ShortBaby-Mg2w',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 85),
                Form(
                  key: _formstate,
                  autovalidateMode: _autoValidateMode,
                  child: Column(
                    spacing: 40,
                    children: [
                      CustomTextField(
                        label: 'Username',
                        icon: Icons.person,
                        onChanged: (value) => username = value,
                      ),
                      CustomTextField(
                        label: 'Password',
                        icon: Icons.password,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) => pass = value,
                      ),

                      CustomButton(
                        text: 'Save Patient Data',
                        onPressed: () {
                          if (_formstate.currentState!.validate()) {
                            if (username == username1 && pass == pass1) {
                              setState(() {
                                _autoValidateMode = AutovalidateMode.always;
                                Timer(const Duration(seconds: 3), () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/home',
                                  );
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Wellcom ..'),

                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      6,
                                      6,
                                      6,
                                    ),
                                  ),
                                );
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error ..'),

                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    255,
                                    1,
                                    1,
                                  ),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
