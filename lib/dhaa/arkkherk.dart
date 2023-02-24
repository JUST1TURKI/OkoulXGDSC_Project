// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../PrayerScreen/dhaa.dart';

class arkkherk extends StatefulWidget {
  const arkkherk({super.key});

  @override
  State<arkkherk> createState() => _arkkherk();
}

class _arkkherk extends State<arkkherk> {
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
                                builder: (context) => const dhaa()));
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
                    'ارق غيرك',
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
                    'بسم الله أرقيك، من كل شيءٍ يؤذيك، من شرّ كلّ نفسٍ أو عين حاسدٍ الله يشفيك، بسم الله أرقيك',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'بسم الله الذي لا يضر مع اسمه شيءٌ في الأرض ولا في السماء وهو السميع العليم؛ ثلاث مراتٍ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'بسم الله يبْريك، ومن كل داءٍ يشفيك، ومن شرّ حاسدٍ إذا حسد، وشرّ كلّ ذي عينٍ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'بسم الله (ثلاثًا) أعوذ بالله وقدرته من شرّ ما أجد وأحاذر؛ سبع مراتٍ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
