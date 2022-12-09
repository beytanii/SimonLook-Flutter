import 'package:flutter/material.dart';
import 'package:simon_look/gameplay.dart';
import 'package:simon_look/gameover.dart';

class GameButton extends StatelessWidget {
  GameButton({super.key, required this.indecis, required this.score});
  List<int> indecis;
  int score;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> _scoreDisplay = ValueNotifier<int>(score);
    Widget scoreDisplay = const Text('score');

    List<int> indexList = indecis;
    List<int> solution = [];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(251, 204, 110, 1.0),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
            flex: 1,
            child: Container(
                // color: Colors.red,
                )),
        Expanded(
            flex: 1,
            child: Center(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/simonlook-score.png',
                  width: 250,
                ),
                ValueListenableBuilder<int>(
                  builder: (BuildContext context, int score, Widget? child) {
                    // This builder will only get called when the _counter
                    // is updated.
                    return Text(
                      '$score',
                      style: Theme.of(context).textTheme.headline2,
                    );
                  },
                  valueListenable: _scoreDisplay,
                  // The child parameter is most helpful if the child is
                  // expensive to build and does not depend on the value from
                  // the notifier.
                  child: scoreDisplay,
                )
              ],
            ))),
        Expanded(
            flex: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        Expanded(
                          flex: 1,
                          child: GameButtonCheck(
                            index: index,
                            list: indexList,
                            ans: solution,
                            score: _scoreDisplay,
                          ),
                        )
                      ]);
                    }),
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
                // color: Colors.red,
                )),
      ]),
    );
  }
}

class GameButtonCheck extends StatefulWidget {
  GameButtonCheck(
      {super.key,
      required this.index,
      required this.list,
      required this.ans,
      required this.score});

  int index;
  List<int> list;
  List<int> ans;
  ValueNotifier<int> score;

  @override
  State<GameButtonCheck> createState() => _GameButtonCheck();
}

class _GameButtonCheck extends State<GameButtonCheck> {
  var simonLookButton = [
    'assets/images/simonlook-buttons-01.png',
    'assets/images/simonlook-buttons-02.png',
    'assets/images/simonlook-buttons-03.png',
    'assets/images/simonlook-buttons-04.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (widget.index == widget.list[widget.ans.length]) {
              widget.ans.add(widget.index);
              widget.score.value += 1;
              if (widget.ans.length == widget.list.length) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => GamePlay(
                            randoIndex: widget.list,
                            score: widget.score.value)));
              }
            } else {
              (Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => Gameover(score: widget.score.value))));
            }
          });
        },
        child: Image.asset(
          simonLookButton[widget.index],
          height: 200,
        ));
  }
}
