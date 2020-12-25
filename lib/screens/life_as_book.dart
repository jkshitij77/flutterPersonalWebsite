import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
// import 'package:page_turn/page_turn.dart';
// import 'text_page.dart';

class BookChapterScreen extends StatefulWidget {
  var screenSize;
  BookChapterScreen({this.screenSize});
  static final String bookScreenRoute = "/bookScreenRoute";

  @override
  _BookChapterScreenState createState() => _BookChapterScreenState();
}

class _BookChapterScreenState extends State<BookChapterScreen> {
  int start = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Center(
          child: AspectRatio(
            aspectRatio: 1 / 1.414,
            child: FlipCard(
              speed: 1000,
              direction: FlipDirection.HORIZONTAL, // default

              // Front card starts here
              front: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 50,
                ),
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFCCCCCC),
                child: Column(
                  children: [
                    Text(
                      'Contents',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 45,
                      ),
                    ),
                    SizedBox(height: 40),
                    // Expand and have padding
                    // Make a class for my text widgets
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        superChapter("The start"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),

                        superChapter("The Catholic Life"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),

                        superChapter("CMS"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),

                        superChapter("Dartmouth"),
                        chapter(start++, "Scond thing", "Bruh"),
                        chapter(start++, "Scond thing", "Bruh"),
                      ],
                    ),
                  ],
                ),
              ),
              back: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color(0xFFCCCCCC),
                child: Text('Back'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget chapter(int chapterNumber, String chapterName, String pages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$chapterNumber) $chapterName',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          '$pages',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget superChapter(String chapterName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$chapterName',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.black,
            fontSize: 45,
          ),
        ),
      ],
    );
  }
}
