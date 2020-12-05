import 'package:flutter/material.dart';
import 'package:animated_text/animated_text.dart';

class BucketListPage extends StatelessWidget {
  var screenSize;

  BucketListPage({this.screenSize});

  static final String bucketListRoute = "/bucketListRoute";

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        // preferredSize: Size.fromHeight(100),
        preferredSize: MediaQuery.of(context).size * .25,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Color(0xFF263238),
            ),
            Center(
              child: Text(
                '"You only live twice"',
                style: TextStyle(
                  fontSize: 100,
                  fontFamily: 'Electrolize',
                  color: Color(0xFFDDDDDD),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 20,
          bottom: 50,
        ),
        width: MediaQuery.of(context).size.width,
        color: Color(0xBB263238),
        child: getCardWidget("First thing"),
      ),
    );
  }

  Widget getCardWidget(String string) {
    return Container(
      width: screenSize.height * .2,
      child: Center(
        child: Text(
          string,
          style: TextStyle(
            fontFamily: 'Lobster',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
        color: Color(0xFF263238),
      ),
    );
  }
}

// AnimatedText(
// alignment: Alignment.center,
// speed: Duration(milliseconds: 1000),
// controller: AnimatedTextController.loop,
// displayTime: Duration(milliseconds: 1000),
// wordList: ['Kshitij', 'Jain', 'contact me', 'See ya soon'],
// textStyle: TextStyle(
// color: Colors.black, fontSize: 55, fontWeight: FontWeight.w700),
// onAnimate: (index) {
// print("Animating index:" + index.toString());
// },
// onFinished: () {
// print("Animation finished");
// },
// ),
