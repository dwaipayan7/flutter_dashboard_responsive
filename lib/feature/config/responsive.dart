import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 767;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024 &&
          MediaQuery.of(context).size.width >= 768;


  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1025;



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    if(width >= 1025){
      return desktop;
    }else if(width >= 768 && tablet != null){
      return tablet;
    }
    else{
      return mobile;
    }
  }
}