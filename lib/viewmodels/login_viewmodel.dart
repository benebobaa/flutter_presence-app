import 'package:flutter/material.dart';
import 'package:flutter_presence/data/repository/auth_repository.dart';
import 'package:flutter_presence/data/services/local/access_token.dart';
import 'package:flutter_presence/di/service_locator.dart';
import 'package:flutter_presence/view/home_screen.dart';

import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier {
  final _authRepo = getIt.get<AuthRepository>();
  final _sharedPref = getIt.get<SharedPref>();
  bool isLoading = false;

  // void submit(
  //     {required String nim, required String password, required context}) async {
  //   try {
  //     print('login bro');
  //     isLoading = true;
  //     notifyListeners();
  //     var response = await _authRepo.login(
  //       nim: nim,
  //       password: password,
  //     );
  //     isLoading = false;
  //     notifyListeners();
  //     print(response.statusCode);
  //     print(response.data['message']!);
  //     if (response.statusCode == 200) {
  //       // await _sharedPref.saveToken(token: response.data['access_token']);
  //       // final test = await Provider.of<HomeViewModel>(context, listen: false)
  //       //     .getMatkulData(nim: nim);

  //       // (test) async {
  //       //   await Provider.of<HomeViewModel>(context, listen: false)
  //       //       .getMatkulData(nim: nim);
  //       // };

  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => const HomeScreen()));
  //     }
  //     // _sharedPref.saveToken(token: response.data['access_token']);
  //     // if (response.data['success']!) {
  //     //   Navigator.pushReplacement(context,
  //     //       MaterialPageRoute(builder: (context) => const HomeScreen()));
  //     // }
  //   } catch (e) {
  //     print(e);
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }
}


//auth?nim=20.11.3740&password=36448