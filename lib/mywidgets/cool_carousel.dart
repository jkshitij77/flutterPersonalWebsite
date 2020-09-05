import 'dart:html';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myflutterwebsite/utils/responsive_web.dart';

class CarouselMine extends StatefulWidget {
  @override
  _CarouselMineState createState() => _CarouselMineState();
}

class _CarouselMineState extends State<CarouselMine> {
  var _current;
  final List<String> imagesForCarousel = [
    'assets/img2.jpeg',
    'assets/img.jpeg',
    'assets/img2.jpeg',
    'assets/img.jpeg',
    'assets/img2.jpeg',
    'assets/img.jpeg',
  ];

  final List<String> stringsForCarousel = [
    'Image 1',
    'Image 2',
    'Image 3',
    'Image 4',
    'Image 5',
    'Image 6',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: getListOfImagesForCarousel(imagesForCarousel),
          options: CarouselOptions(
            scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                ? PageScrollPhysics()
                : NeverScrollableScrollPhysics(),
            enlargeCenterPage: true,
            aspectRatio: 18 / 8,
            autoPlay: true,
            onPageChanged: (index, reasonPageChanged) {
              setState(() {
                _current = index;
              });
            },
            // initialPage: 3,
            // enableInfiniteScroll: true,
          ),
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              stringsForCarousel[_current],
              style: TextStyle(
                fontSize: 18,
                color: Colors.greenAccent,
                letterSpacing: 8,
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> getListOfImagesForCarousel(List<String> list) {
    return list
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
}
