import 'package:flutter/material.dart';
import 'package:flutter_presence/di/service_locator.dart';
import 'package:flutter_presence/utils/scroll_web.dart';
import 'package:flutter_presence/view/splash_screen.dart';
import 'package:flutter_presence/viewmodels/home_viewmodel.dart';
import 'package:flutter_presence/viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SplashScreen(),
    );
  }
}
