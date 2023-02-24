// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/PrayerScreen/Adhkar.dart';

class adkarSabah extends StatefulWidget {
  const adkarSabah({super.key});

  @override
  State<adkarSabah> createState() => _adkarSabah();
}

class _adkarSabah extends State<adkarSabah> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home() //create new class for 'home' property of MaterialApp()
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 243, 227),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            Container(
              height: size.height * 0.5,
              width: size.width * 1,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 50,
                      color: Colors.brown,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                  ),
                  image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/moshala.jpg'))),
              child: Column(children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Adhkar()));
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 70),
                  margin: const EdgeInsets.only(top: 70),
                  child: const Text(
                    'اذكار الصباح',
                    style: TextStyle(fontFamily: 'Rakkas', fontSize: 60),
                  ),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.layers),
                  const Text(
                    'أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير ، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذا اليوم وَخَـيرَ ما بَعْـدَه ، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذا اليوم وَشَرِّ ما بَعْـدَه، رَبِّ أَعـوذُبِكَ مِنَ الْكَسَـلِ وَسـوءِ الْكِـبَر ، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    'عـوذُ بِكَلِمـاتِ اللّهِ التّـامّـاتِ مِنْ شَـرِّ ما خَلَـق',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  const Text(
                    'اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
