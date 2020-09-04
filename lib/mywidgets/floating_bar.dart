import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myflutterwebsite/utils/responsive_web.dart';
import 'package:myflutterwebsite/screens/bucket_list_page.dart';
import 'package:get/get.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';

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

  List<String> routes = ['/', BucketListPage.bucketListRoute, '/'];

  List<Widget> getCardElements() {
    rowElements.clear();

    for (int i = 0; i < items.length; i++) {
      String s = items[i];
      IconData iconData = icons[i];

      Widget bro = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () async {
          if (items[i] == 'Bucket List')
            Get.to(BucketListPage());
          else if (items[i] == 'Professional') {
            print('pdf');
            await PdfDocument.openAsset('Assets/Kshitij Resume Jefferies.pdf');
          }
        },
        onHover: (hovering) {
          setState(() {
            _isHovering[i] = hovering;
//            hovering ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        child: Text(
          items[i],
          style: TextStyle(fontSize: 16, letterSpacing: 1.5),
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
          top: widget.screenSize.height * 0.40,
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
                                  onTap: () {
                                    if (items[pageIndex] == 'Bucket List')
                                      Get.to(BucketListPage());
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

//TODO: Render my resume with the resume button
//  Show my achievements and shit
//  final document = await PdfDocument.openAsset('assets/sample.pdf');
//  final page = await document.getPage(1);
//  final pageImage = await page.render(width: page.width, height: page.height);
//  await page.close();
