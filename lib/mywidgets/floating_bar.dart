import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myflutterwebsite/screens/life_as_book.dart';
import 'package:myflutterwebsite/screens/professional.dart';
import 'package:myflutterwebsite/utils/responsive_web.dart';
import 'package:myflutterwebsite/screens/bucket_list_page.dart';
import 'package:myflutterwebsite/screens/temporary.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingBarMidWayThroughPage extends StatefulWidget {
  final screenSize;

  const FloatingBarMidWayThroughPage({Key key, @required this.screenSize})
      : super(key: key);

  @override
  _FloatingBarMidWayThroughPageState createState() =>
      _FloatingBarMidWayThroughPageState();
}

class _FloatingBarMidWayThroughPageState
    extends State<FloatingBarMidWayThroughPage> {
  List _isHovering = [false, false, false];
  List<Widget> rowElements = [];

  List<String> items = ['Professional', 'Bucket List', 'My life'];
  List<IconData> icons = [
    Icons.school,
    Icons.cake,
    Icons.people,
  ];

  List<String> routes = [
    ProfessionalPage.professionalPageRoute,
    BucketListPage.bucketListRoute,
    '/'
  ];

  List<Widget> getCardElements() {
    rowElements.clear();

    for (int i = 0; i < items.length; i++) {
      // String s = items[i];
      // IconData iconData = icons[i];

      Widget bro = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () async {
          if (items[i] == 'Bucket List')
            Get.to(BucketListPage());
          else if (items[i] == 'My life') {
            Get.to((BookChapterScreen()));
          } else {
            // Get.to(TemporaryPage());
            // TODO: Change this to professional
            // Get.to(ProfessionalPage());

            const url =
                'https://jkshitij77.github.io/flutterwebsite/Assets/sample.pdf';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          }
        },
        onHover: (hovering) {
          setState(() {
            print(hovering);
            _isHovering[i] = hovering;
          });
        },
        child: Text(
          items[i],
          style: TextStyle(
            //TODO: Animate some changes here?
            decoration: _isHovering[i] ? TextDecoration.underline : null,
            fontSize: 20,
            letterSpacing: 1.5,
            color: Colors.black,
          ),
        ),
      );

      Widget verticalSpaceThing = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          thickness: 1,
          color: Colors.black45,
        ),
      );

      rowElements.add(bro);
      if (i < items.length - 1) {
        rowElements.add(verticalSpaceThing);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: widget.screenSize.height * 0.48,
          left: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
          right: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width / 12
              : widget.screenSize.width / 5,
        ),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(items.length).map((int pageIndex) =>
                      Padding(
                        padding:
                            EdgeInsets.only(top: widget.screenSize.height / 80),
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: widget.screenSize.height / 45,
                                bottom: widget.screenSize.height / 45,
                                left: widget.screenSize.width / 20),
                            child: Row(
                              children: [
                                Icon(
                                  icons[pageIndex],
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                SizedBox(width: widget.screenSize.width / 20),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  onTap: () async {
                                    if (items[pageIndex] == 'Bucket List')
                                      Get.to(BucketListPage(
                                        screenSize: widget.screenSize,
                                      ));
                                    else if (items[pageIndex] == 'My life') {
                                      Get.to(TemporaryPage());
                                      // Get.to((BookChapterScreen()));
                                    } else {
                                      const url =
                                          'https://jkshitij77.github.io/flutterwebsite/Assets/sample.pdf';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    }
                                  },
                                  child: Text(
                                    items[pageIndex],
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .primaryTextTheme
                                            .button
                                            .color,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.screenSize.height / 50,
                    bottom: widget.screenSize.height / 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: getCardElements(),
                  ),
                ),
              ),
      ),
    );
  }
}
