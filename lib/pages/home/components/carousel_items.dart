import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/carousel_item_model.dart';

import 'flag.dart';

List<CarouselItemModel> carouselItems = List.generate(
  1,
      (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage("images/logo.png"),
            alignment: Alignment.bottomLeft,
            width: 400,
          ),
          SizedBox(
            height: 18.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.black87,
                border: Border.all(
                  color: Colors.black87,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "         LÜTFEN DİL SEÇİNİZ\nPLEASE SELECT LANGUAGE ",
                  style: GoogleFonts.almarai(
                    color: Colors.white,
                    fontSize: 25.0,
                    height: 1.1,
                  ),

                ),
              ),
            ),
          ),
          SizedBox(

            height: 25.0,
          ),
          ClipRRect(

            child: Container(

                child: Flag()
            ),
          ),
        ],
      ),
    ),
    image: Container(
      child: Image.asset(
        "assets/home.png",
        fit: BoxFit.contain,
      ),
    ),
  ),
);
