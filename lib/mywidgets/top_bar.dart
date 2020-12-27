import 'package:flutter/material.dart';
import 'package:myflutterwebsite/screens/temporary.dart';
import 'package:get/get.dart';
import 'package:myflutterwebsite/utils/responsive_web.dart';
import 'dialog.dart';

class TopBar extends StatefulWidget {
  final screenSize;
  final double opacity;

  const TopBar({Key key, @required this.screenSize, this.opacity}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final List isHovering = [false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
                  print(widget.opacity);
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
                          isHovering[0] ? Color(0xFF243949).withOpacity(widget.opacity) : Color(0xFF445969).withOpacity(widget.opacity),
                      fontFamily: 'Electrolize',
                    ),
                  ),
                  Text(
                    "JAIN",
                    style: TextStyle(
                      fontSize: widget.screenSize.height * 0.10,
                      fontWeight: FontWeight.bold,
                      color:
                          isHovering[0] ? Color(0xFF243949).withOpacity(widget.opacity) : Color(0xFF445969).withOpacity(widget.opacity),
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
                  MyDialog.myContactModal(context, screenSize, .05);
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
