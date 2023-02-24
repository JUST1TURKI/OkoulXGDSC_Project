import 'package:flutter/material.dart';
import 'package:flutter_application_1/PrayerScreen/dhaa.dart';

class arkNafsek extends StatefulWidget {
  const arkNafsek({super.key});

  @override
  State<arkNafsek> createState() => _arkNafsek();
}

class _arkNafsek extends State<arkNafsek> {
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => dhaa()));
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
                    'ارق نفسك',
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
                  Icon(Icons.layers),
                  const Text(
                    'أعُوذُ باللَّهِ وَقُدْرَتِهِ مِن شَرِّ ما أَجِدُ وَأُحَاذِرُ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'أَعُوذُ بكَلِمَاتِ اللَّهِ التَّامَّةِ، مِن كُلِّ شيطَانٍ وهَامَّةٍ، ومِنْ كُلِّ عَيْنٍ لَامَّةٍ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'أعوذُ باللَّهِ السَّميعِ العَليمِ مِنَ الشَّيطانِ الرَّجيمِ مِن هَمزِهِ، ونَفخِهِ ونَفثِهِ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'بسمِ اللَّهِ الَّذي لا يضرُّ معَ اسمِهِ شيءٌ في الأرضِ ولَا في السَّماءِ، وَهوَ السَّميعُ العليمُ ',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'اللهمَّ عافِني في بدني، اللهمَّ عافِني في سمعي، اللهمَّ عافِني في بصري',
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
