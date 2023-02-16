import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kodlaseoshop/AppData.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../Model/FlagList.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

final List<FlagItem> flagItems = [
  FlagItem(
    url: "images/t.png",
    title: "Türkçe",
    page: "/WidthScreen",
    id: 1,
  ),
  FlagItem(
    url: "images/uk.png",
    title: "İngilizce",
    page: "/DepthScreen",
    id: 2,
  )
];

class Flag extends StatelessWidget {
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: flagItems
                      .map(
                        (flagItems) => Container(
                          height: 120.0,
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        child: InkWell(
                                      onTap: () {
                                        AppData.language = flagItems.id;
                                        Navigator.pushNamed(
                                            context, flagItems.page);
                                      },
                                      child: Image.asset(
                                        flagItems.url,
                                        width: 55.0,
                                      ),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${flagItems.title}\n",
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context, flagItems.page);
                                          },
                                        style: TextStyle(
                                          color: kCaptionColor,
                                          height: 1.8,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}
