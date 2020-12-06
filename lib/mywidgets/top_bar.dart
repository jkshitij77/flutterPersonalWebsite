import 'package:flutter/material.dart';
import 'package:myflutterwebsite/screens/temporary.dart';
import 'package:get/get.dart';
import 'package:myflutterwebsite/utils/responsive_web.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TopBar extends StatefulWidget {
  final screenSize;

  const TopBar({Key key, @required this.screenSize}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final List isHovering = [false, false];
  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    // TODO: Is the above line fine?
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40 ? 1 : 0;
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Get.to(TemporaryPage());
              },
              onHover: (hovering) {
                setState(() {
                  hovering ? isHovering[0] = true : isHovering[0] = false;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "KSHITIJ",
                    style: TextStyle(
                      fontSize: widget.screenSize.height * 0.10,
                      fontWeight: FontWeight.bold,
                      color:
                          isHovering[0] ? Color(0xFF243949) : Color(0xFF445969),
                      fontFamily: 'Electrolize',
                    ),
                  ),
                  Text(
                    "JAIN",
                    style: TextStyle(
                      fontSize: widget.screenSize.height * 0.10,
                      fontWeight: FontWeight.bold,
                      color:
                          isHovering[0] ? Color(0xFF243949) : Color(0xFF445969),
                      fontFamily: 'Electrolize',
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !ResponsiveWidget.isSmallScreen(context),
              child: InkWell(
                onTap: () {
                  // Get.to(TemporaryPage());
                  print("DUDE Dialog");
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: screenSize.height,
                        color: Color(0xFF263238),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Reach me at ',
                                    style: TextStyle(
                                      fontSize: screenSize.height * .05,
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      print("MY DUDES send an email");
                                    },
                                    child: SelectableText(
                                      'Kshitij.jain.23@dartmouth.edu',
                                      style: TextStyle(
                                        fontSize: screenSize.height * .05,
                                        color: Colors.lightBlueAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Call me at ',
                                    style: TextStyle(
                                      fontSize: screenSize.height * .05,
                                      color: Colors.white,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      print("MY DUDES Call me");
                                      launch("tel://6036781223");
                                    },
                                    child: Text(
                                      '+1 603-678-1223',
                                      style: TextStyle(
                                        fontSize: screenSize.height * .05,
                                        color: Colors.lightBlueAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height:20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    color: Colors.white,
                                    iconSize: screenSize.height * .07,
                                    icon: FaIcon(FontAwesomeIcons.linkedin),
                                    onPressed: () async {
                                      if (await canLaunch(
                                          'https://www.linkedin.com/in/kshitij-jain-1a57b5165/')) {
                                        await launch(
                                            'https://www.linkedin.com/in/kshitij-jain-1a57b5165/');
                                      }
                                    },
                                  ),
                                  SizedBox(width: screenSize.width * .03),
                                  IconButton(
                                    color: Colors.white,
                                    iconSize: screenSize.height * .07,
                                    icon: FaIcon(FontAwesomeIcons.github),
                                    onPressed: () async {
                                      if (await canLaunch(
                                          'https://github.com/jkshitij77')) {
                                        await launch(
                                            'https://github.com/jkshitij77');
                                      }
                                    },
                                  ),
                                  SizedBox(width: screenSize.width * .03),
                                  IconButton(
                                    color: Colors.white,
                                    iconSize: screenSize.height * .07,
                                    icon: FaIcon(FontAwesomeIcons.facebook),
                                    onPressed: () async {
                                      if (await canLaunch(
                                          'https://www.facebook.com/kshitij.jain.359/')) {
                                        await launch(
                                            'https://www.facebook.com/kshitij.jain.359/');
                                      }
                                    },
                                  ),
                                ],
                              ),
                              /* ElevatedButton(
                                child: Text('Go back'),
                                onPressed: () => Navigator.pop(context),
                              ), */
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                onHover: (hovering) {
                  setState(() {
                    hovering ? isHovering[1] = true : isHovering[1] = false;
                  });
                },
                child: Text(
                  "Contact me",
                  style: TextStyle(
                    fontSize: widget.screenSize.height * .04,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Electrolize',
                    color:
                        isHovering[1] ? Color(0xFF243949) : Color(0xFF445969),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
