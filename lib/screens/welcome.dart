import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../AppData.dart';
import '../pages/home/components/carousel.dart';
import '../pages/home/components/widthList_item_detail.dart';
import '../utils/constants.dart';
import '../utils/screen_helper.dart';
import 'LanguageScreen.dart';

class Welcome extends StatefulWidget {
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ScreenHelper(
          desktop: _buildUi(kDesktopMaxWidth),
          tablet: _buildUi(kTabletMaxWidth),
          mobile: _buildUi(getMobileMaxWidth(context)),
        ),
      ),
    );
  }

  Widget _buildUi(double width) {
    return WillPopScope(
        child: Scaffold(
            body: Center(
            child: SingleChildScrollView(
              child: Material(
                type: MaterialType.transparency,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ResponsiveWrapper(
                      maxWidth: width,
                      minWidth: width,
                      defaultScale: false,
                      child: Container(
                        child: Flex(
                          direction: constraints.maxWidth > 720
                              ? Axis.horizontal
                              : Axis.vertical,
                          children: [
                            // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                            Expanded(
                              flex: ScreenHelper.isMobile(context) ? 0 : 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "welcome",
                                    style: GoogleFonts.alata(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40.0,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
