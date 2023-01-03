import 'package:flutter/material.dart';
import 'package:flutter_presence/utils/background_login_screen.dart';
import 'package:flutter_presence/utils/image_top_login.dart';
import 'package:flutter_presence/utils/responsive.dart';
import 'package:flutter_presence/utils/textfield_container.dart';
import 'package:flutter_presence/view/login_screen_mobile.dart';
import 'package:flutter_presence/view/splash_screen.dart';
import 'package:flutter_presence/viewmodels/login_viewmodel.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nim = TextEditingController();
  final _password = TextEditingController();
  final ValueNotifier<bool> _isVisible = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: const MobileLoginScreen(),
            tablet: Row(
              children: [
                const Expanded(
                  child: LoginScreenTopImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: Form(
                          child: Column(
                            children: [
                              TextFieldContainer(
                                  controller: _nim,
                                  hintText: 'NIM',
                                  icon: Icons.person),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: TextFieldContainer(
                                  controller: _password,
                                  hintText: 'Password',
                                  icon: Icons.lock,
                                  valueListenablePass: _isVisible,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 270,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SplashScreen()));
                                  },
                                  child: const Text(
                                    'LOGIN',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
