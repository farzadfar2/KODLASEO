import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';
import '../pages/home/components/depthList_item_detail.dart';
import '../utils/globals.dart';




class DepthScreen extends StatelessWidget {

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
                child:
                DepthListItemDetail()

              ),
              SizedBox(
                width: 50.0,
              ),
              Expanded(
                flex: ScreenHelper.isMobile(context) ? 0 : 2,
                child:
                Image.asset(
                  "assets/person.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
