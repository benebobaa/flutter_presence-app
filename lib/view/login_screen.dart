import 'package:flutter/material.dart';
import 'package:flutter_presence/utils/background_login_screen.dart';
import 'package:flutter_presence/utils/image_top_login.dart';
import 'package:flutter_presence/utils/responsive.dart';
import 'package:flutter_presence/utils/textfield_container.dart';
import 'package:flutter_presence/view/splash_screen.dart';
import 'package:flutter_presence/viewmodels/login_viewmodel.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileLoginScreen(),
          desktop: Row(
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
                            const TextFieldContainer(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "NIM",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(Icons.person),
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: TextFieldContainer(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Icon(Icons.lock),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
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
    );
  }
}

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  late LoginViewModel vm;

  // Form and Text Controller
  final _loginFormKey = GlobalKey<FormState>();
  final _nim = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    vm = Provider.of<LoginViewModel>(context, listen: false);

    /// Run method on Widget build complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // FocusScope.of(context).requestFocus(_initialFocus);
    });
  }

  void login(context) {
    vm.submit(
      context: context,
      nim: _nim.text.trim(),
      password: _password.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Form(
                  child: Column(
                children: [
                  TextFieldContainer(
                    child: TextField(
                      controller: _nim,
                      decoration: const InputDecoration(
                        hintText: "NIM",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.person),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFieldContainer(
                      child: TextField(
                        controller: _password,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.lock),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Consumer<LoginViewModel>(
                    builder: ((context, value, _) {
                      if (value.isLoading) {
                        return SizedBox(
                            width: 270,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Loading...',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ));
                      }
                      return SizedBox(
                          width: 270,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () => login(context),
                            child: const Text(
                              'Login',
                            ),
                          ));
                    }),
                  ),
                ],
              )),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
