import 'package:flutter/material.dart';
import 'package:myflutterwebsite/utils/responsive_web.dart';
// import 'package:animated_text/animated_text.dart';

class BucketListPage extends StatelessWidget {
  var screenSize;

  BucketListPage({this.screenSize});

  static final String bucketListRoute = "/bucketListRoute";

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    var widthMultiplier = screenSize.width/100;

    return Scaffold(
      appBar: PreferredSize(
        // preferredSize: Size.fromHeight(100),
        preferredSize: screenSize * .25,
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
                  fontSize: screenSize.height/10,
                  fontFamily: 'Electrolize',
                  color: Color(0xFFDDDDDD),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.only(
            top: screenSize.height/18,
            bottom: 50,
            left: widthMultiplier*7.5,
            right: widthMultiplier*7.5,
          ),
          width: MediaQuery.of(context).size.width,
          color: Color(0xBB263238),
          child: Row(
            children: [
              // Column 1 starts here
              Column(
                children: [
                  getCardWidget("Paint a starry night"),
                  getCardWidget("Work on a farm"),
                  getCardWidget("Write my own manga"),
                  getCardWidget("Learn surfing"),
                  getCardWidget("Dig a grave"),
                  getCardWidget("Learn how to fix a car"),
                  getCardWidget("Learn to spit fire"),
                  getCardWidget("Write and perform a song"),
                  getCardWidget("Have Something Named After Me"),
                ],
              ),
              SizedBox(width: widthMultiplier*5),
              // Column 2 starts here
              Column(
                children: [
                  getCardWidget("Learn watch making"),
                  getCardWidget("Camp in a rainforest"),
                  getCardWidget("Sing on a stage before a huge crowd"),
                  getCardWidget("Star in a movie"),
                  getCardWidget("Sail across an ocean"),
                  getCardWidget("Get full arm tattoos"),
                  getCardWidget("Save a life"),
                  getCardWidget("Visit a death row inmate"),
                ],
              ),
              SizedBox(width: widthMultiplier*5),
              // Column 3 starts here
              Column(
                children: [
                  getCardWidget("Play an actual rugby match"),
                  getCardWidget("Learn how to use a switchblade"),
                  getCardWidget("Make a music video"),
                  getCardWidget("Walk across an entire country"),
                  getCardWidget("Buy a sweet Cabana"),
                  getCardWidget("Pose nude for art"),
                  getCardWidget("Live with the monks for a month"),
                  getCardWidget("Dance in a flash mob"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCardWidget(String string) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(24),
          width: screenSize.width * .25,
          child: Center(
            child: Text(
              string,
              style: TextStyle(
                fontFamily: 'Electrolize',
                color: Colors.white,
                // TODO: Fix the font size
                fontSize: 15,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
            color: Color(0xFF263238),
          ),
        ),
        SizedBox(height: 20),
      ],
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
