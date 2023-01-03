import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presence/view/home_screen.dart';
import 'package:flutter_presence/view/login_screen.dart';

import 'package:lottie/lottie.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen())));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(225),
                  ),
                ),
                child: Lottie.asset("assets/splash_animation.json",
                    height: 200, width: 200),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Made by'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('beneboba'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
