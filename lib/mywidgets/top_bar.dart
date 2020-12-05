import 'package:flutter/material.dart';
import 'package:myflutterwebsite/screens/temporary.dart';
import 'package:get/get.dart';

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
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? 1
        : 0;
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
                        color: isHovering[0]
                            ? Color(0xFF243949)
                            : Color(0xFF445969),
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
            InkWell(
              onTap: () {
                Get.to(TemporaryPage());
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
                  color: isHovering[1] ? Color(0xFF243949) : Color(0xFF445969),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
