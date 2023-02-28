import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../AppData.dart';
import '../pages/home/components/ShopDetailShowScreen.dart';
import '../pages/home/components/ShopProductImageDetailShowScreen.dart';
import '../pages/home/components/shopModulListDetailShow_item.dart';
import '../utils/constants.dart';
import '../utils/screen_helper.dart';

class ShopDetailShowScreeen extends StatefulWidget {
  @override
  State<ShopDetailShowScreeen> createState() => _ShopDetailShowScreeenState();
}

class _ShopDetailShowScreeenState extends State<ShopDetailShowScreeen> {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

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



  @override
  void initState() {
    setState(() {
      AppData.Zorumualanfalse = [];
      AppData.Zorumualantrue = [];
      AppData.namProductImagees = [];
      AppData.TotalUrunMaxYukseklik = [];
      AppData.TotalUrunagrlik = [];
      AppData.TotalUrunfiyat = [];
      AppData.TotalUrunDesi = [];
      AppData.ModulListId = [];
      AppData.modulLists = [];
      AppData.enablewidget = false;
    });

  }

  Widget _buildUi(double width) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10, left: 0),
            child: Image.asset(
              "images/logo.png",
              width: 150,
            ),
          ),
          actions: [
            Container(
              child: InkWell(
                onTap: () {
                  setState(() {
                    AppData.Zorumualanfalse = [];
                    AppData.Zorumualantrue = [];
                    AppData.namProductImagees = [];
                    AppData.TotalUrunMaxYukseklik = [];
                    AppData.TotalUrunagrlik = [];
                    AppData.TotalUrunfiyat = [];
                    AppData.TotalUrunDesi = [];
                    AppData.ModulListId = [];


                    AppData.modulLists = [];
                    AppData.enablewidget = false;
                  });
                  Navigator.pushNamed(context, "/CreateProductListItemDetail");


                },
                child: Tooltip(
                  key: tooltipkey,
                  triggerMode: TooltipTriggerMode.manual,
                  showDuration: const Duration(seconds: 1),
                  message: 'Geri Git',
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
                        flex: constraints.maxWidth > 720.0 ? 1 : 0,
                        child: ShopModulListDetailShow()),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                        flex: constraints.maxWidth > 720.0 ? 1 : 0,
                        child: ShopDetailShow()),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                        flex: constraints.maxWidth > 720.0 ? 1 : 0,
                        child: ShopProductImageDetailShow()),
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
