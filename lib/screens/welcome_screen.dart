import 'package:flutter/material.dart';
import 'package:myflutterwebsite/mywidgets/floating_bar.dart';
import 'dart:async';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
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
        child: Container(
//          color: Colors.blueAccent,
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "KSHITIJ",
                        style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                            fontFamily: 'Lobster'),
//                            color: Colors.blueGrey[100],
//                            fontSize: 20,
//                            fontFamily: 'Montserrat',
//                            fontWeight: FontWeight.w400,
//                            letterSpacing: 3,
                      ),
                      Text(
                        "JAIN",
                        style: TextStyle(
                            fontSize: 80,
                            color: Colors.white,
                            fontFamily: 'Lobster'),
                      ),
                    ],
                  ),
                  Text("Contact me"),
                ],
              )),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: SizedBox(
              height: screenSize.height * 0.45,
              width: screenSize.width,
              child: Image.asset(
                'Assets/img.jpeg',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          FloatingBarMidWayThroughPage(screenSize: screenSize,)
        ],
      ),
    );
  }
}
