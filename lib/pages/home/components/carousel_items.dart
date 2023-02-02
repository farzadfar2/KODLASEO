import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/carousel_item_model.dart';
import '../../../utils/constants.dart';
import 'flag.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage("images/logo.png"),
            alignment: Alignment.bottomLeft,
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "LÜTFEN DİL SEÇİN",
            style: GoogleFonts.oswald(
              color: kCaptionColor,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(child: Flag()),
        ],
      ),
    ),
    image: Container(
      child: Image.asset(
        "assets/person.png",
        fit: BoxFit.contain,
      ),
    ),
  ),
);
