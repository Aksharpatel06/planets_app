import 'package:flutter/material.dart';
import 'componects/multiple_planets.dart';
import 'componects/text_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e0e0e),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/img/splash/splash_img.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              introTextAndButton(context),
              multiplePlanets(),
            ],
          ),
        ),
      ),
    );
  }
}
