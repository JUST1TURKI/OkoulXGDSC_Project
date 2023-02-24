import 'package:flutter/material.dart';

import 'PrayerScreen.dart';
import 'adkarMasa.dart';
import 'adkarSabah.dart';

void main() {
  runApp(const Adhkar());
}

class Adhkar extends StatefulWidget {
  const Adhkar({super.key});

  @override
  State<Adhkar> createState() => _Adhkar();
}

class _Adhkar extends State<Adhkar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home() //create new class for 'home' property of MaterialApp()
        //to escape 'No MaterialLocalizations found' error
        );
  }
}

class Home extends StatefulWidget {
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
          crossAxisSpacing: 60,
          mainAxisSpacing: 60,
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
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                image: DecorationImage(
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/adkarTwo.jpg'))),
            child: Column(children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 30,
                  ),
                ),
              ),
            ]),
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => adkarSabah()));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(108, 87, 12, 1),
                      padding: EdgeInsets.all(8),
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                          topRight: Radius.circular(10),
                        ),
                      )),
                  child: const Text(
                    'اذكار الصباح',
                    style: TextStyle(
                      fontFamily: 'Rakkas',
                      fontSize: 40,
                      color: Color.fromARGB(181, 244, 241, 225),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => adkarMasa()));
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(108, 87, 12, 1),
                      padding: EdgeInsets.all(8),
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                          topRight: Radius.circular(10),
                        ),
                      )),
                  child: const Text(
                    'اذكار المساء',
                    style: TextStyle(
                      fontFamily: 'Rakkas',
                      fontSize: 40,
                      color: Color.fromARGB(181, 244, 241, 225),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
