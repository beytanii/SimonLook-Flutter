import 'package:flutter/material.dart';
import 'main.dart';

class Gameover extends StatelessWidget {
  const Gameover({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(251, 204, 110, 1.0),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Expanded(flex: 3, child: Container()),
              Expanded(
                  flex: 4,
                  child: Text(
                    'GAME\nOVER',
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/simonlook-gameover-score.png',
                      width: 250,
                    ),
                    Text(
                      score.toString(),
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                      onTap: () => (Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SimonLook()))),
                      child: Text(
                        'GO TO HOME',
                        style: Theme.of(context).textTheme.headline3,
                      ))),
              Expanded(flex: 4, child: Container()),
            ])));
  }
}
