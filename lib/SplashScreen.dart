// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, unused_import, file_names

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter/material.dart';

import 'Register.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/lastLogo.jpg',
      ),
      logoWidth: 80,
      title: const Text(
        "مصلى",
        style: TextStyle(fontSize: 50, fontFamily: 'Rakkas'),
      ),
      backgroundColor: const Color(0xFFD9D9D9),
      showLoader: true,
      loadingText: const Text(
        "إذا ما الليل أظلم كابدوه.. فيسفر عنهم وهم ركوع",
        style: TextStyle(fontSize: 22, fontFamily: 'Rakkas'),
      ),
      navigator: const Register(),
      durationInSeconds: 4,
    );
  }
}
