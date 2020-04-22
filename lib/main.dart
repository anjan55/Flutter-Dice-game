import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text('Dicee Game'),
          backgroundColor: Colors.red,
        ),
        body: Dice(),
      ),
    );
  }
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftNumber = 1;
  int rightNumber = 1;
  int leftDiceSum = 0;
  int rightDiceSum = 0;
  bool isLeftDicePressed = true;
  bool isRightDicePressed = true;

  void changeDiceFaceLeft() {
    setState(() {
      isLeftDicePressed = false;
      isRightDicePressed = true;
      leftNumber = Random().nextInt(6) + 1;
      leftDiceSum = leftDiceSum + leftNumber;
    });

    if (leftDiceSum >= 100) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Player1 is Winner !!'),
              content: Text(
                  'Player1 has score 100 first.'),
              actions: <Widget>[
                FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      resetValues();
                      Navigator.of(context).pop();
                    })
              ],
            );
          });
    }
  }

  void changeDiceFaceRight() {
    setState(() {
      isRightDicePressed = false;
      isLeftDicePressed = true;
      rightNumber = Random().nextInt(6) + 1;
      rightDiceSum = rightDiceSum + rightNumber;
    });

    if (rightDiceSum >= 100) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Player2 is Winner !!'),
                content: Text(
                    'Player2 has score 100 first.'),
                actions: <Widget>[
                  FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        resetValues();
                        Navigator.of(context).pop();
                      })
                ]);
          });
      resetValues();
    }
  }

  void resetValues() {
    setState(() {
      leftNumber = 1;
      rightNumber = 1;
      leftDiceSum = 0;
      rightDiceSum = 0;
      isLeftDicePressed = true;
      isRightDicePressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Row(
            children: <Widget>[
                Expanded(
                  child: Text('Player who score 100 first will be winner.',
                  textAlign: TextAlign.center,),
                ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'Player 1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.00),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'Player 2',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.00),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      child: Image.asset('images/dice$leftNumber.png'),
                      onPressed: () {
                        if (isLeftDicePressed) {
                          changeDiceFaceLeft();
                        } else {
                          //null
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      child: Image.asset('images/dice$rightNumber.png'),
                      onPressed: () {
                        if (isRightDicePressed) {
                          changeDiceFaceRight();
                        } else {
                          //null
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Score: $leftDiceSum',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.00),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Score: $rightDiceSum',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.00),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
