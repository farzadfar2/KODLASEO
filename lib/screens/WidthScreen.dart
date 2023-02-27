import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../pages/home/components/widthList_item_detail.dart';
import '../utils/constants.dart';
import '../utils/screen_helper.dart';

class WidthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
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
                            "Seç",
                            style: GoogleFonts.almarai(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "OLUŞTURACAĞINIZ ÜRÜNÜNÜN\nGELNİŞĞİNİ SEÇİN",
                            style: GoogleFonts.alata(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              height: 1.1,
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Column(
                            children: [
                              Container(child: WidthListItemDetail()),
                            ],
                          ),
                          SizedBox(
                            height: 70.0,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 2,
                      child: Image.asset(
                        "assets/page3.png",
                        // Set width for image on smaller screen
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
