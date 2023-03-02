import 'package:dcache/dcache.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kodlaseoshop/AppData.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/FlagList.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

final List<FlagItem> flagItems = [
  FlagItem(
    url: "images/t.png",
    title: "Türkçe",
    page: "/WidthScreen",
    id: 1,
    doviz: 'TRY',
  ),
  FlagItem(
    url: "images/uk.png",
    title: "İngilizce",
    page: "/WidthScreen",
    id: 2,
    doviz: 'USD',
  ),

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Wrap(
                  //alignment: WrapAlignment.spaceBetween,
                  spacing: 30.0,
                  runSpacing: 30.0,
                  children: flagItems
                      .map(
                        (flagItems) => ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Container(
                        // height: 130.0,
                        width: ScreenHelper.isMobile(context)
                            ? constraints.maxHeight / 2.0 - 70.0
                            : constraints.maxWidth / 4.0 - 70.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 50,
                              blurRadius: 50,
                            ),
                          ],
                          color: Colors.grey.shade50,
                          border: Border.all(
                            color: Colors.grey.shade50,
                          ),
                        ),
                        child: Column(
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: RichText(
                                textAlign: TextAlign.center,
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
                                        color: Colors.grey.shade600,
                                        fontSize: 20,
                                        height: 1.8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: InkWell(
                                        onTap: () async{
                                         // AppData.c.set("language", flagItems.id);
                                         // AppData.c.set("doviz", flagItems.doviz);
                                          final prefs = await SharedPreferences.getInstance();
                                          await prefs.setInt('language', flagItems.id);
                                          await prefs.setString('doviz', flagItems.doviz);

                                          AppData.language = flagItems.id;
                                          AppData.doviz = flagItems.doviz;
                                          Navigator.pushNamed(
                                              context, flagItems.page);
                                        },
                                        child: Image.asset(
                                          flagItems.url,
                                          // width: 55.0,
                                        ),
                                      ))
                                ],
                              ),
                            ),
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
