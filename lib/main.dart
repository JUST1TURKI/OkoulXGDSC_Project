// ignore_for_file: avoid_print, depend_on_referenced_packages, unused_import

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/PrayerScreen/dhaa.dart';
import 'package:flutter_application_1/Register.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_1/adhkar/adkarMasa.dart';
import 'package:flutter_application_1/adhkar/adkarSabah.dart';
import 'package:flutter_application_1/dhaa/arkNafsek.dart';
import 'package:flutter_application_1/dhaa/arkkherk.dart';
import 'package:flutter_application_1/dhaa/wrd.dart';
import 'PrayerScreen/Adhkar.dart';
import 'PrayerScreen/PrayerScreen.dart';
import 'SplashScreen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const InfoPage());
}

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _Home();
}

class _Home extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/a': (ctx) => const Home(),
          '/b': (ctx) => const SplashPage(),
          '/c': (ctx) => const Register(),
          '/d': (ctx) => const MainScreen(),
          '/e': (ctx) => const SplashPage(),
          '/f': (ctx) => const dhaa(),
          '/g': (ctx) => const Adhkar(),
          '/h': (ctx) => const arkkherk(),
          '/i': (ctx) => const arkNafsek(),
          '/j': (ctx) => const wrd(),
          '/k': (ctx) => const adkarMasa(),
          '/l': (ctx) => const adkarSabah(),
        },
        home:
            const Home() //create new class for 'home' property of MaterialApp()
        //to escape 'No MaterialLocalizations found' error
        );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _controller = PageController(
    initialPage: 3,
  );
  int _currentIndex = 3;

  final List<Data> myData = [
    Data(
      title: '',
      description: '',
      imageUrl: 'assets/images/PV4.jpg',
      descriptiveTwo: 'الأذكار',
    ),
    Data(
      title: 'أدعية',
      description: '',
      imageUrl: 'assets/images/dhaa.jpg',
      descriptiveTwo: '',
    ),
    Data(
      title: 'مواقيت الصلاة',
      description: '',
      imageUrl: 'assets/images/PV2.jpg',
      descriptiveTwo: '',
    ),
    Data(
      title: 'مصلى',
      description: 'تعرف معنا على مزايا التطبيق',
      imageUrl: 'assets/images/PV1.jpg',
      descriptiveTwo: '',
    ),
  ];
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentIndex > 0) _currentIndex--;
      _controller.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    });
    // ~ When the app in the background but opend and user taps on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      Navigator.of(context).pushNamed(routeFromMessage);
    });
    FirebaseMessaging.instance.getInitialMessage();
    //~ forground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Builder(
            builder: ((context) => PageView(
                  controller: _controller,
                  children: myData
                      .map((item) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(item.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 195,
                                ),
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                      color: Color(0xFF2D380C),
                                      fontFamily: 'Rakkas',
                                      fontSize: 40),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.description,
                                      style: const TextStyle(
                                          color: Color(0xFF2D380C),
                                          fontFamily: 'Rakkas',
                                          fontSize: 26),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.descriptiveTwo,
                                      style: const TextStyle(
                                          color: Color(0xFF2D380C),
                                          fontFamily: 'Rakkas',
                                          fontSize: 40),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                  onPageChanged: (val) {
                    setState(() {
                      _currentIndex = val;
                      if (_currentIndex == 0) {
                        Future.delayed(const Duration(seconds: 3),
                            () => Navigator.of(context).pushNamed('/b'));
                      }
                    });
                  },
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const Alignment(0, 0.85),
                child: Indicator(_currentIndex),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Builder(
            builder: (ctx) => Align(
              alignment: const Alignment(0, 0.7),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pushNamed('/b');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(76, 61, 8, 1),
                      padding: const EdgeInsets.all(8),
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      )),
                  child: const Text(
                    "تخط و ابدا",
                    style: TextStyle(fontFamily: 'Rakkas', fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Data {
  final String title;
  final String description;
  final String imageUrl;
  final String descriptiveTwo;

  Data({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.descriptiveTwo,
  });
}

class Indicator extends StatelessWidget {
  final int index;
  // ignore: prefer_const_constructors_in_immutables
  Indicator(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildContainer(index == 0 ? const Color(0xFF2D380C) : Colors.grey),
        buildContainer(index == 1 ? const Color(0xFF2D380C) : Colors.grey),
        buildContainer(index == 2 ? const Color(0xFF2D380C) : Colors.grey),
        buildContainer(index == 3 ? const Color(0xFF2D380C) : Colors.grey),
      ],
    );
  }

  Container buildContainer(Color color) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
