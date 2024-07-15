import 'package:flutter/material.dart';
import 'package:planets_app/view/controller/home_controller.dart';
import 'package:planets_app/view/screen/details/details_screen.dart';
import 'package:planets_app/view/screen/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeController(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Color(0xff0e0e0e),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
