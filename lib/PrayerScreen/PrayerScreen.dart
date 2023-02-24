// ignore_for_file: unnecessary_import, depend_on_referenced_packages, library_private_types_in_public_api, file_names, unnecessary_string_interpolations
import 'package:flutter_application_1/Register.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/PrayerScreen/Adhkar.dart';
import 'package:flutter_application_1/PrayerScreen/dhaa.dart';
import 'package:http/http.dart' as http;
import '../Data\'s/JSON.dart';
import '../Data\'s/data.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:timer_builder/timer_builder.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    getPTData();
  }

  JsonConnection jsonConnection = JsonConnection();

  late Data list;

  static String city = 'Dammam';
  static String country = 'Saudi Arabia';
  static int method = 4;

  final String url =
      'https://api.aladhan.com/v1/timingsByCity/23-02-2023?city=$city&country=$country&method=$method';
  Future getPTData() async {
    http.Response response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    list = Data.fromJson(data);

    return list;
  }

  final String currentTime = getSystemTime();

  static getSystemTime() {
    return DateFormat.jms().format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFFFFEED2),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: size.height * 0.75,
                width: size.width * 0.65,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Colors.brown,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/MainScreen.jpg'))),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 40),
                child: Column(
                  children: [
                    FutureBuilder(
                        future: getPTData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return Row(
                              children: [
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.mosque,
                                      size: 50,
                                      color: Color.fromARGB(255, 95, 52, 36),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      'الفجر',
                                      style: TextStyle(
                                        fontSize: 27,
                                        fontFamily: 'Rakkas',
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.data.timings.fajr,
                                      style: const TextStyle(
                                        fontFamily: 'Rakkas',
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'الظهر',
                                      style: TextStyle(
                                        fontSize: 27,
                                        fontFamily: 'Rakkas',
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.data.timings.dhuhr,
                                      style: const TextStyle(
                                        fontFamily: 'Rakkas',
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'العصر',
                                      style: TextStyle(
                                        fontSize: 27,
                                        fontFamily: 'Rakkas',
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.data.timings.asr,
                                      style: const TextStyle(
                                        fontFamily: 'Rakkas',
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'المغرب',
                                      style: TextStyle(
                                        fontSize: 27,
                                        fontFamily: 'Rakkas',
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.data.timings.maghrib,
                                      style: const TextStyle(
                                        fontFamily: 'Rakkas',
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'العشاء',
                                      style: TextStyle(
                                        fontSize: 27,
                                        fontFamily: 'Rakkas',
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.data.timings.isha,
                                      style: const TextStyle(
                                        fontFamily: 'Rakkas',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          } else {
                            return const CircularProgressIndicator(
                              color: Colors.brown,
                            );
                          }
                        }),
                  ],
                ),
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                  return Text(
                    "${getSystemTime()}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Rakkas',
                    ),
                  );
                }),
                // ignore: prefer_const_constructors
                Align(
                  child: const Text(
                    '    مصلى',
                    style: TextStyle(fontSize: 60, fontFamily: "Rakkas"),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const dhaa()));
                    });
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'ادعية',
                    style: TextStyle(
                      fontFamily: 'Rakkas',
                      fontSize: 40,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 228, 183, 22),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      )),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Adhkar()));
                  });
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'اذكار',
                  style: TextStyle(
                    fontFamily: 'Rakkas',
                    fontSize: 40,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 228, 183, 22),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Register()));
          });
        },
        backgroundColor: Colors.brown,
        foregroundColor: Color.fromARGB(255, 33, 33, 33),
        child: const Icon(
          Icons.login_outlined,
          size: 30,
        ),
      ),
    );
  }
}
