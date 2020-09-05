import 'package:flutter/material.dart';
import 'package:myflutterwebsite/mywidgets/cool_carousel.dart';
import 'package:myflutterwebsite/mywidgets/floating_bar.dart';
import 'package:myflutterwebsite/mywidgets/top_bar.dart';

class WelcomeScreen extends StatefulWidget {
  static final welcomeScreenRoute = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var screenSize;
  var heightMultiplier;
  var widthMultiplier;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    heightMultiplier = screenSize.height / 100;
    widthMultiplier = screenSize.width / 100;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: TopBar(
          screenSize: screenSize,
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.52,
                    width: screenSize.width,
                    child: Image.asset(
                      // TODO: Change the image
                      'assets/bg.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FloatingBarMidWayThroughPage(
                      screenSize: screenSize,
                    ),
                    Container(
                      child: Column(
                        children: [
                          // TODO: Featured
                          // FeaturedHeading(
                          //   screenSize: screenSize,
                          // ),
                          // FeaturedTiles(screenSize: screenSize)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// TODO: WORK resume interests and bucket list