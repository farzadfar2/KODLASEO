import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
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
                      flex: constraints.maxWidth > 720.0 ? 3 : 0,
                    child: ShopModulListDetailShow()
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Expanded(
                      flex: constraints.maxWidth > 720.0 ? 3 : 0,
                    child:  ShopDetailShow()
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Expanded(
                      flex: constraints.maxWidth > 720.0 ? 3 : 0,
                      child:  ShopProductImageDetailShow()
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
