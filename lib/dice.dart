import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int left = 1;
  int right = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset('image/dice$left.png')),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: Image.asset('image/dice$right.png')),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ButtonTheme(
              minWidth: 100,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    left = Random().nextInt(6) + 1;
                    right = Random().nextInt(6) + 1;
                  });
                  showToast("Left dice: $left , Right dice: $right ");
                },
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
