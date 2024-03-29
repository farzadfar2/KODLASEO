import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../AppData.dart';
import '../pages/home/components/carousel.dart';
import '../pages/home/components/widthList_item_detail.dart';
import '../pages/home/home.dart';
import '../utils/constants.dart';
import '../utils/screen_helper.dart';
import 'LanguageScreen.dart';

class WidthScreen extends StatefulWidget {
  @override
  State<WidthScreen> createState() => _WidthScreenState();
}

class _WidthScreenState extends State<WidthScreen> {
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
          appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(top: 10, left: 0),
                child: Image.asset(
                  AppData.language ==1 ? "images/logo.png" :"images/seofree-en.png" ,
                  width: 150,
                //  height: 80,
                ),
              ),
              actions: [
                Container(
                  child: InkWell(
                    onTap: () {
                    //   Navigator.pop(context);
                     // Navigator.pushNamed(context, "/Carousel");
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Home()));
                    },
                    child: Tooltip(
                      key: tooltipkey,
                      triggerMode: TooltipTriggerMode.manual,
                      showDuration: const Duration(seconds: 1),
                      message:  AppData.language ==1 ?'Geri Git' :'Back',
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Image.asset(
                          "images/back.png",
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0),

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
                                  Text( AppData.language ==1 ? "Seç": "Select",
                                    style: GoogleFonts.alata(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(   AppData.language ==1 ?  "OLUŞTURACAĞINIZ ÜRÜNÜNÜN\nGENİŞLİĞİNİ SEÇİN" : "PLEASE SELECT\nYOUR PRODUCT WIDTH",
                                    style: GoogleFonts.alata(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      height: 1.4,
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
                                width:
                                    constraints.maxWidth > 720.0 ? null : 350.0,
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
