// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_presence/data/repository/home_repository.dart';
// import 'package:flutter_presence/data/services/local/access_token.dart';
// import 'package:flutter_presence/di/service_locator.dart';
// import 'package:flutter_presence/models/matkul_data.dart';
// import 'package:flutter_presence/view/splash_screen.dart';

// class HomeViewModel with ChangeNotifier {
//   final _homeRepository = getIt.get<HomeRepository>();
//   final SharedPref storage = getIt.get<SharedPref>();
//   List<MatkulData> _matkul = [];

//   List<MatkulData> get matkul => _matkul;

//   Future<bool> getMatkulData({required String nim, context}) async {
//     String? token = await storage.readToken();
//     if (token == null) {
//       // snackbarMessage(context, 'Debug Mode - Do not have token');
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const SplashScreen()),
//       );
//     }
//     try {
//       final data = await _homeRepository.matkul(nim: nim, access_token: token!);
//       if (data == []) {
//         print(data);
//         return true;
//       } else {
//         _matkul = data;
//         notifyListeners();
//         return false;
//       }
//     } catch (e) {
//       print('viewmodel home eror');
//       print(e);
//       return true;
//     }
//   }
// }
