import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDialog {
  static myContactModal(BuildContext context, Size screenSize, double multiplier) async {
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
                        fontSize: screenSize.height * multiplier,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print("MY DUDES send an email");
                      },
                      child: SelectableText(
                        'Kshitij.jain.23@dartmouth.edu',
                        style: TextStyle(
                          fontSize: screenSize.height * multiplier,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                      onTap: () {
                        print("MY DUDES Call me");
                        launch("tel://6036781223");
                      },
                      child: Text(
                        '+1 603-678-1223',
                        style: TextStyle(
                          fontSize: screenSize.height * multiplier,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                        if (await canLaunch('https://github.com/jkshitij77')) {
                          await launch('https://github.com/jkshitij77');
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
  }
}
