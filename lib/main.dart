//Magic Ball Project
//Angela did by randomizing the photo names and displaying it
//I added image and overlay with list of strings. These texts are randomised and displayed above image.
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0XFF274397),
        appBar: AppBar(
          title: Text('Magic Ball App'),
          backgroundColor: Color.fromARGB(255, 192, 206, 250),
        ),
        body: BallApp(),
      ),
    ),
  );
}

class BallApp extends StatefulWidget {
  const BallApp({super.key});

  @override
  State<BallApp> createState() => _BallAppState();
}

class _BallAppState extends State<BallApp> {
  final List<String> Answers = ['Yes', 'No', 'We will see', 'Maybe'];
  String DisplayedAnswer = ''; //variable to hold randomised answer
  void RandomAns() {
    setState(() {
      DisplayedAnswer =
          Answers[Random().nextInt(Answers.length)]; //Answer[randomlistdata]
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'Ask me Anything',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Question: What is your question?',
                    semanticsLabel: DisplayedAnswer,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                print('Button is pressed');
                RandomAns();
              },
              child: Stack(
                // stack text over the image
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/magicball/magicball.png',
                    height: 300,
                    width: 300,
                  ),
                  Text(
                    DisplayedAnswer,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 20, 20, 20)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
