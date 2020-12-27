import 'package:flutter/material.dart';
import 'package:myflutterwebsite/mywidgets/cool_carousel.dart';
import 'package:myflutterwebsite/mywidgets/floating_bar.dart';
import 'package:myflutterwebsite/mywidgets/top_bar.dart';
import 'package:myflutterwebsite/utils/responsive_web.dart';
import 'package:myflutterwebsite/mywidgets/dialog.dart';

class WelcomeScreen extends StatefulWidget {
  static final welcomeScreenRoute = '/';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;


  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  var screenSize;
  var heightMultiplier;
  var widthMultiplier;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    heightMultiplier = screenSize.height / 100;
    widthMultiplier = screenSize.width / 100;

    _opacity = _scrollPosition < screenSize.height * 0.40
        ? (screenSize.height * 0.40 - _scrollPosition) / (screenSize.height * 0.40)
        : 0;
    print("_opacity");
    print(_scrollPosition);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: TopBar(
          screenSize: screenSize,
          opacity: _opacity,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.52,
                    width: screenSize.width,
                    child: Image.network(
                      'https://github.com/jkshitij77/flutterwebsite/blob/master/Assets/bg.jpeg?raw=true',
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
                          SizedBox(
                            height: screenSize.height * .05,
                          ),
                          Text(
                            "Oh, the Places You'll Go!",
                            style: TextStyle(
                              fontSize: screenSize.height * 0.10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF243949),
                              fontFamily: 'Electrolize',
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * .03,
                          ),
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
            ),
            CarouselMine(),
            Visibility(
              visible: ResponsiveWidget.isSmallScreen(context),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * .05,
                  ),
                  InkWell(
                    onTap: () {
                      MyDialog.myContactModal(context, screenSize, .035);
                    },
                    child: Text(
                      'Contact me',
                      style: TextStyle(
                        fontSize: screenSize.width * .1,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Electrolize',
                        color: Color(0xFF243949),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .05,
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
