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
    bool isSmall = ResponsiveWidget.isSmallScreen(context);
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
                  getCardWidget(isSmall, "Paint a starry night"),
                  getCardWidget(isSmall, "Work on a farm"),
                  getCardWidget(isSmall, "Write my own manga"),
                  getCardWidget(isSmall, "Learn surfing"),
                  getCardWidget(isSmall, "Dig a grave"),
                  getCardWidget(isSmall, "Learn how to fix a car"),
                  getCardWidget(isSmall, "Learn to spit fire"),
                  getCardWidget(isSmall, "Write and perform a song"),
                  getCardWidget(isSmall, "Have Something Named After Me"),
                  getCardWidget(isSmall, "Ride the Trans Siberian railroad"),
                  getCardWidget(isSmall, "Camp under the stars"),
                  getCardWidget(isSmall, "Make Jay and Shit's compilation of high five broments to the public"),
                ],
              ),
              SizedBox(width: widthMultiplier*5),
              // Column 2 starts here
              Column(
                children: [
                  getCardWidget(isSmall, "Learn watch making"),
                  getCardWidget(isSmall, "Camp in a rainforest"),
                  getCardWidget(isSmall, "Sing on a stage before a huge crowd"),
                  getCardWidget(isSmall, "Star in a movie"),
                  getCardWidget(isSmall, "Sail across an ocean"),
                  getCardWidget(isSmall, "Get full arm tattoos"),
                  getCardWidget(isSmall, "Save a life"),
                  getCardWidget(isSmall, "Visit a death row inmate"),
                  getCardWidget(isSmall, "Go on a 2am sledding date"),
                  getCardWidget(isSmall, "The Kshit-Makky special"),
                  getCardWidget(isSmall, "Go contradancing in Norwich"),
                ],
              ),
              SizedBox(width: widthMultiplier*5),
              // Column 3 starts here
              Column(
                children: [
                  getCardWidget(isSmall, "Play an actual rugby match"),
                  getCardWidget(isSmall, "Learn how to use a switchblade"),
                  getCardWidget(isSmall, "Make a music video"),
                  getCardWidget(isSmall, "Walk across an entire country"),
                  getCardWidget(isSmall, "Buy a sweet Cabana"),
                  getCardWidget(isSmall, "Pose nude for art"),
                  getCardWidget(isSmall, "Live with the monks for a month"),
                  getCardWidget(isSmall, "Dance in a flash mob"),
                  getCardWidget(isSmall, "Burning man festival"),
                  getCardWidget(isSmall, "Grow out beard for a year"),
                  getCardWidget(isSmall, "Hveravellir Hot spring"),
                  getCardWidget(isSmall, "Visit Tons in Ukraine"),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCardWidget(bool isSmall, String string) {
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
                fontSize: isSmall? 10 : 15,
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
