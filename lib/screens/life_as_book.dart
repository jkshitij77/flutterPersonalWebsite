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

  @override
  Widget build(BuildContext context) {
    int start = 1;
    var screenSize = MediaQuery.of(context).size;
    var hm = screenSize.height/100;
    var wm = screenSize.width/100;

    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Center(
          child: AspectRatio(
            aspectRatio: 1 / 1.414,
            child: Container(
                padding: EdgeInsets.only(
                  top:100,
                  bottom: 40,
                  left: 50,
                  right: 50,
                ),
                width: double.infinity,
                height: double.infinity,
                // color: Color(0xFFCCCCCC),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      'Contents',
                      style: TextStyle(
                        // decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: hm*10,
                        fontFamily: 'TNR'
                      ),
                    ),
                    SizedBox(height: 100),
                    // Expand and have padding
                    // Make a class for my text widgets
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* superChapter("The start"),

                        superChapter("The Catholic Life"),

                        superChapter("CMS"),*/
                        superChapter("Dartmouth", hm),
                        chapter(start++, "The fall we don't talk about", "Bruh", hm),
                        chapter(start++, "The Death in December", "Bruh", hm),
                        chapter(start++, "The eventful winter", "Bruh", hm),
                        chapter(start++, "The break of growth", "Bruh", hm),
                        chapter(start++, "The bittersweet fall", "Bruh", hm),
                        chapter(start++, "The smoke on the bridge", "Bruh", hm),
                      ],
                    ),
                  ],
                ),
              ),/* FlipCard(
              speed: 1000,
              direction: FlipDirection.HORIZONTAL, // default

              // Front card starts here
              front: Container(
                padding: EdgeInsets.only(
                  top:100,
                  bottom: 40,
                  left: 50,
                  right: 50,
                ),
                width: double.infinity,
                height: double.infinity,
                // color: Color(0xFFCCCCCC),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      'Contents',
                      style: TextStyle(
                        // decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: hm*10,
                        fontFamily: 'TNR'
                      ),
                    ),
                    SizedBox(height: 100),
                    // Expand and have padding
                    // Make a class for my text widgets
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* superChapter("The start"),

                        superChapter("The Catholic Life"),

                        superChapter("CMS"),*/
                        superChapter("Dartmouth", hm),
                        chapter(start++, "The fall we don't talk about", "Bruh", hm),
                        chapter(start++, "The Death in December", "Bruh", hm),
                        chapter(start++, "The eventful winter", "Bruh", hm),
                        chapter(start++, "The break of growth", "Bruh", hm),
                        chapter(start++, "The bittersweet fall", "Bruh", hm),
                        chapter(start++, "The smoke on the bridge", "Bruh", hm),
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
            ), */
          ),
        ),
      ),
    );
  }

  Widget chapter(int chapterNumber, String chapterName, String pages, var hm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$chapterNumber) $chapterName',
          style: TextStyle(
            color: Colors.black,
            fontSize: hm*2.5,
          ),
        ),
        Text(
          '$pages',
          style: TextStyle(
            color: Colors.black,
            fontSize: hm*2.5,
          ),
        ),
      ],
    );
  }

  Widget superChapter(String chapterName, var hm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$chapterName',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.black,
            fontSize: hm*7,
            fontFamily: 'TNR',
          ),
        ),
      ],
    );
  }
}
