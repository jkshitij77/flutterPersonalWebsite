import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  final screenSize;

  const TopBar({Key key, @required this.screenSize}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final List isHovering = [false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
//          color: Colors.blueAccent,
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
              onTap: (){},
              onHover: (hovering){
                setState(() {
                  hovering? isHovering[0] = true:  isHovering[0] = false;
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
                      color: isHovering[0]? Color(0xFF243949) : Color(0xFF445969),
                      fontFamily: 'Electrolize',
                      // fontFamily: 'Lobster',
//                            color: Colors.blueGrey[100],
//                            fontSize: 20,
//                            fontFamily: 'Montserrat',
//                            fontWeight: FontWeight.w400,
//                            letterSpacing: 3,
                    ),
                  ),
                  Text(
                    "JAIN",
                    style: TextStyle(
                      fontSize: widget.screenSize.height * 0.10,
                      fontWeight: FontWeight.bold,
                      color: isHovering[0]? Color(0xFF243949) : Color(0xFF445969),
                      fontFamily: 'Electrolize',
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){},
              onHover: (hovering){
                setState(() {
                  hovering? isHovering[1] = true:  isHovering[1] = false;
                });
              },
              child: Text(
                "Contact me",
                style: TextStyle(
                  fontSize: widget.screenSize.height * .04,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Electrolize',
                  color: isHovering[1]? Color(0xFF243949) : Color(0xFF445969),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
