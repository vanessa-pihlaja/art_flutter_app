import 'package:flutter/material.dart';

class Breakpoints {
  static const double mobile = 768;
  static const double tablet = 1030;
  static const double desktop = 1500;  
}

class ScreenSize {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < Breakpoints.mobile;
  }

  static bool isTablet(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width >= Breakpoints.mobile && width < Breakpoints.tablet;
  }

  static bool isLaptop(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return width >= Breakpoints.tablet && width < Breakpoints.desktop;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= Breakpoints.desktop;
  }
}