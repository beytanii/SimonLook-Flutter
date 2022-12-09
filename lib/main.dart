import 'package:flutter/material.dart';
import 'package:simon_look/gameover.dart';
// import 'package:simon_look/gamebttn.dart';
import 'gameplay.dart';

void main() {
  runApp(const SimonLook());
}

class SimonLook extends StatelessWidget {
  const SimonLook({super.key});

  @override
  Widget build(BuildContext context) {
    int score = 0;
    List<int> randoIndex = [];

    return MaterialApp(
        theme: ThemeData(
            // text
            textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 68.0,
              color: Colors.deepOrange.shade900,
              fontWeight: FontWeight.w900),
          headline2: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 32.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          headline3: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 21.0,
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w700),
        )),
        home: Builder(
            builder: (context) => Scaffold(
                  backgroundColor: const Color.fromRGBO(251, 204, 110, 1.0),
                  body: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                              // color: Colors.red,
                              )),
                      Expanded(
                          flex: 3,
                          child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Image.asset(
                                'assets/images/simonlook-logo.png',
                                height: 200,
                              ))),
                      Expanded(
                          flex: 1,
                          child: Container(
                              // color: Colors.red,
                              )),
                      Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GamePlay(
                                      randoIndex: randoIndex, score: score)),
                              // GameButton()),
                            ),
                            child: Image.asset(
                              'assets/buttons/btn_play.png',
                              width: 250,
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                              // color: Colors.red,
                              )),
                    ],
                  )),
                )));
  }
}
