import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_presence/view/home_screen.dart';
import 'package:flutter_presence/view/login_screen.dart';

import 'package:lottie/lottie.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
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
