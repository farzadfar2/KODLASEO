import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kodlaseoshop/pages/home/components/Modulcart.dart';
import 'package:kodlaseoshop/pages/home/components/createProductList_item_detail.dart';
import 'package:kodlaseoshop/pages/home/home.dart';
import 'package:kodlaseoshop/provider/listProvider.dart';
import 'package:kodlaseoshop/screens/DepthScreen.dart';
import 'package:kodlaseoshop/screens/LanguageScreen.dart';
import 'package:kodlaseoshop/screens/WidthScreen.dart';
import 'package:kodlaseoshop/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SEO",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        canvasColor: kBackgroundColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      routes: {
        '/LanguegeScreen': (context) => LanguegeScreen(),
        '/WidthScreen': (context) => WidthScreen(),
        '/DepthScreen': (context) => DepthScreen(),
        '/CreateProductListItemDetail': (context) => ChangeNotifierProvider<MainModel>(
            create: (context) => MainModel(), child:  CreateProductListItemDetail()),

      },
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
           defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.resize(2460, name: "4K"),
          ],
        background: Container(
          color: kBackgroundColor,
        ),
      ),
      home: Home(),
    );
  }


}
