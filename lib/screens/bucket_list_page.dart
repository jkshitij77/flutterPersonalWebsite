import 'package:flutter/material.dart';
import 'package:animated_text/animated_text.dart';

class BucketListPage extends StatelessWidget {
  static final String bucketListRoute = "/bucketListRoute";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedText(
          alignment: Alignment.center,
          speed: Duration(milliseconds: 1000),
          controller: AnimatedTextController.loop,
          displayTime: Duration(milliseconds: 1000),
          wordList: ['Kshitij', 'Jain', 'contact me', 'See ya soon'],
          textStyle: TextStyle(
              color: Colors.black, fontSize: 55, fontWeight: FontWeight.w700),
          onAnimate: (index) {
            print("Animating index:" + index.toString());
          },
          onFinished: () {
            print("Animation finished");
          },
        ),
      ),
    );
  }
}
