import 'package:flutter/cupertino.dart';

class Dimensions{
  BuildContext context;
  Dimensions({required this.context});
  static double screenHeight= MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  static double screenWidth= MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  static const double mobileSize = 450;
  static const double tabletSize = 600;

  ///padding height
  static double height20=screenWidth/63.28;

  ///padding width
  static double width20=screenWidth/63.28;

  ///size
  static double size20=screenWidth/63.28;
}