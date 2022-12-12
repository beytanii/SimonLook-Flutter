import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:simon_look/gamebttn.dart';

class GamePlay extends StatefulWidget {
  GamePlay({super.key, required this.randoIndex, required this.score});
  List<int> randoIndex;
  int score;

  @override
  _GamePlayState createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  //  this will load everytime widgets gets called
  @override
  void initState() {
    if (widget.randoIndex.length < 4) {
      _initialSeq();
    }
    int randoNum = Random().nextInt(4);
    widget.randoIndex.add(randoNum);
    debugPrint(widget.randoIndex.toString());
    super.initState();
  }

// generates an array everytime game starts
  _initialSeq() {
    while (widget.randoIndex.length < 4) {
      int randoNum = Random().nextInt(4);
      widget.randoIndex.add(randoNum);
    }
  }

// translate random int array to slides
  List<String> _generateSlide(List<int> randoIndecis) {
    List<String> randoSeq = [];

    for (var i = 0; i < randoIndecis.length; i++) {
      if (randoIndecis[i] == 0) {
        randoSeq.add('assets/images/simonlook-buttons-01.png');
      } else if (randoIndecis[i] == 1) {
        randoSeq.add('assets/images/simonlook-buttons-02.png');
      } else if (randoIndecis[i] == 2) {
        randoSeq.add('assets/images/simonlook-buttons-03.png');
      } else {
        randoSeq.add('assets/images/simonlook-buttons-04.png');
      }
    }
    return randoSeq;
  }

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height * .7;
    List<String> randoSeq = _generateSlide(widget.randoIndex);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 204, 110, 1.0),
      body: Center(
          child: Column(children: [
        Expanded(
            flex: 1,
            child: Container(
                // color: Colors.red,
                )),
        Expanded(
            flex: 1,
            child: Center(
                child: Stack(alignment: Alignment.center, children: [
              Image.asset('assets/images/simonlook-score.png', width: 250),
              Text(widget.score.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2)
            ]))),
        Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: AbsorbPointer(
                  child: CarouselSlider(
                options: CarouselOptions(
                  height: 400,
                  // height: height,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index, reason) {
                    if (index == randoSeq.length - 1) {
                      Timer(const Duration(seconds: 1), () {
                        randoSeq = [];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => GameButton(
                                      indecis: widget.randoIndex,
                                      score: widget.score,
                                    )));
                      });
                    }
                  },
                ),
                items: randoSeq.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(i));
                    },
                  );
                }).toList(),
              )),
            )),
        Expanded(
            flex: 1,
            child: Container(
                // color: Colors.red,
                )),
      ])),
    );
  }
}
