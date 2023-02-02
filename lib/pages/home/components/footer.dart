import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../models/footer_item.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';


final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: "assets/mappin.png",
    title: "ADDRESS",
    text1: "999 Carter Street",
    text2: "Sailor Springs, IL 64234",
  ),
  FooterItem(
    iconPath: "assets/phone.png",
    title: "PHONE",
    text1: "+1 618-689-9604",
    text2: "+1 781-689-9632",
  ),
  FooterItem(
    iconPath: "assets/email.png",
    title: "EMAIL",
    text1: "hello@example.com",
    text2: "info@flutterpanda.com",
  ),
  FooterItem(
    iconPath: "assets/whatsapp.png",
    title: "WHATSAPP",
    text1: "+234 901-134-0095",
    text2: "+234 901-134-0095",
  )
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2022 Created By Kodla teknoloji",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "KODLA TEKNOLOJI",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      ),
              ],
                  )
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
