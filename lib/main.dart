import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 7;
  int rightDiceNumber = 7;
  String result ="";

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;

      if (leftDiceNumber > rightDiceNumber)
        {
          result='leftDice est a gagner';
        }else if (leftDiceNumber < rightDiceNumber){
        result='rightDice est a gagner';
      }else  result='null';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Row(
        children: <Widget>[
          Expanded(
      child: Padding(
          padding: const EdgeInsets.all(50.0),

            child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('image/dice-$leftDiceNumber.png'),
            ),
    ),
    ),

          Expanded(

            child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('image/dice-$rightDiceNumber.png'),
            ),
          ),


          Expanded(

              child: Text( "$result")



            ),

        ],
      ),

    );
  }
}