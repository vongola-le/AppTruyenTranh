// ignore: camel_case_types
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_function.dart';
import '../../../../constants/index.dart';
double sizefix( double size , double screen){
   return Sizefix.sizefix(size, screen);
}

class carouseu extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final screenWidth;
  // ignore: prefer_typing_uninitialized_variables
  final screenHeight;
  const carouseu({super.key, required this.screenWidth, required this.screenHeight});

  @override
  State<carouseu> createState() => _carouseuState();
}

// ignore: camel_case_types
class _carouseuState extends State<carouseu> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        // ignore: avoid_unnecessary_containers
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(sizefix(5, widget.screenWidth)),
            child: Image.asset(AppImages.konosuba, fit: BoxFit.contain,),
          ),
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(sizefix(5, widget.screenWidth)),
            child: Image.asset(AppImages.BgAppbarDashboard, fit: BoxFit.cover,),
          ),
        ),
      ],
      options: CarouselOptions(
        height: sizefix(177, widget.screenHeight),
        aspectRatio: 16 / 9,
        viewportFraction: 1.0,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: null,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}