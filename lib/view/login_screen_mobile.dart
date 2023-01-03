import 'package:flutter/material.dart';
import 'package:flutter_presence/bloc/auth/auth_bloc.dart';
import 'package:flutter_presence/utils/image_top_login.dart';
import 'package:flutter_presence/utils/textfield_container.dart';
import 'package:flutter_presence/viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  late LoginViewModel vm;
  final ValueNotifier<bool> _isVisible = ValueNotifier(true);
  // Form and Text Controller
  final _loginFormKey = GlobalKey<FormState>();
  final _nimController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    vm = Provider.of<LoginViewModel>(context, listen: false);

    /// Run method on Widget build complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // FocusScope.of(context).requestFocus(_initialFocus);
    });
  }

  // void login(context) {
  //   vm.submit(
  //     context: context,
  //     nim: _nim.text.trim(),
  //     password: _password.text.trim(),
  //   );
  // }

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
                      controller: _nimController,
                      hintText: 'NIM',
                      icon: Icons.person),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ValueListenableBuilder(
                      valueListenable: _isVisible,
                      builder: (_, value, child) {
                        return TextFieldContainer(
                          controller: _passwordController,
                          hintText: 'Password',
                          icon: Icons.lock,
                          valueListenablePass: _isVisible,
                        );
                      },
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
                            onPressed: () {
                              context.read<AuthBloc>().add(SignIn(
                                  nim: _nimController.text,
                                  password: _passwordController.text));
                            },
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
