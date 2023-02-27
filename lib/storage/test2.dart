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
}

@override
Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Flex(
            direction: ScreenHelper.isMobile(context)
                ? Axis.vertical
                : Axis.horizontal,
            children: [
              Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: ShopModulListDetailShow()),
              SizedBox(
                width: 50.0,
              ),
              Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: ShopDetailShow()),
              SizedBox(
                width: 50.0,
              ),
              Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: ShopProductImageDetailShow()),
            ],
          ),
        );
      },
    ),
  );
}
