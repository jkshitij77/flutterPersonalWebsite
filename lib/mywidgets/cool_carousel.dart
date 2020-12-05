import 'dart:html';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myflutterwebsite/utils/responsive_web.dart';

class CarouselMine extends StatefulWidget {
  @override
  _CarouselMineState createState() => _CarouselMineState();
}

class _CarouselMineState extends State<CarouselMine> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imagesForCarousel = [
    'assets/americac.jpg',
    'assets/asiac.jpg',
    'assets/europec.jpg',
  ];

  final List<String> stringsForCarousel = [
    'America',
    'Asia',
    'Europe',
  ];

  List _isHovering = [false, false, false, false];
  List _isSelected = [true, false, false, false];

  List<Widget> getListOfImagesForCarousel(screenSize) {
    return imagesForCarousel
        .map(
          (e) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              e,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = getListOfImagesForCarousel(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
            scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                ? PageScrollPhysics()
                : NeverScrollableScrollPhysics(),
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlay: true,
            onPageChanged: (index, reasonPageChanged) {
              setState(() {
                _current = index;

                for (int i = 0; i < imageSliders.length; i++) {
                  if (i == index) {
                    _isSelected[i] = true;
                  } else {
                    _isSelected[i] = false;
                  }
                }
              });
            },
            initialPage: 3,
            // enableInfiniteScroll: true,
          ),
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              stringsForCarousel[_current],
              style: TextStyle(
                fontSize: screenSize.height * 0.10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Electrolize',
                letterSpacing: 8,
              ),
            ),
          ),
        ),
        ResponsiveWidget.isSmallScreen(context)
            ? Container()
            : AspectRatio(
                aspectRatio: 17 / 8,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenSize.width / 8,
                        right: screenSize.width / 8,
                      ),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: screenSize.height / 50,
                            bottom: screenSize.height / 50,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0;
                                  i < stringsForCarousel.length;
                                  i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[i] = true
                                              : _isHovering[i] = false;
                                        });
                                      },
                                      onTap: () {
                                        _controller.animateToPage(i);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenSize.height / 80,
                                            bottom: screenSize.height / 90),
                                        child: Text(
                                          stringsForCarousel[i],
                                          style: TextStyle(
                                            color: _isHovering[i]
                                                ? Theme.of(context)
                                                    .primaryTextTheme
                                                    .button
                                                    .decorationColor
                                                : Theme.of(context)
                                                    .primaryTextTheme
                                                    .button
                                                    .color,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[i],
                                      child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 400),
                                        opacity: _isSelected[i] ? 1 : 0,
                                        child: Container(
                                          height: 5,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          width: screenSize.width / 10,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
