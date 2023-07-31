import 'dart:async';

import 'package:calculator/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ExtraPage extends StatefulWidget {
  const ExtraPage({super.key});

  @override
  State<ExtraPage> createState() => _ExtraPageState();
}

class _ExtraPageState extends State<ExtraPage> {
  bool answer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Calculator",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            answer == false
                ? LoadingAnimationWidget.prograssiveDots(
                    color: Colors.red,
                    size: 200,
                  )
                : Text(""),
            answer
                ? LoadingAnimationWidget.twistingDots(
                    leftDotColor: Colors.red,
                    rightDotColor: Colors.blue,
                    size: 200,
                  )
                : Text(""),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(side: BorderSide.none),
              onPressed: () {
                setState(() {
                  answer = true;
                });
                Timer(Duration(seconds: 4), () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => HomePage())));
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 4,
                    vertical: 20),
                child: Text(
                  "Start",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
