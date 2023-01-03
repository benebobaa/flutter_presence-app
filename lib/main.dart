import 'package:flutter/material.dart';
import 'package:flutter_presence/bloc/auth/auth_bloc.dart';
import 'package:flutter_presence/di/service_locator.dart';
import 'package:flutter_presence/utils/scroll_web.dart';
import 'package:flutter_presence/view/home_screen.dart';
import 'package:flutter_presence/view/splash_screen.dart';
import 'package:flutter_presence/view/splash_screen2.dart';
import 'package:flutter_presence/view/splash_screen3.dart';
import 'package:flutter_presence/viewmodels/home_viewmodel.dart';
import 'package:flutter_presence/viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(MultiProvider(
      providers: [Provider(create: (_) => AuthBloc())], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc()..add(CheckAuthStatus()),
      child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSignedIn) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SplashScreen2()));
            } else if (state is AuthSignOut) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SplashScreen()));
            }
          },
          child: MaterialApp()),
    );
  }
}
