import 'package:flutter/material.dart';

class LayoutSpacing {
  LayoutSpacing._();
  static const double heightFour = 4.0;
  static const double heightEight = 8.0;
  static const double heighttwelve = 12.0;
  static const double heightSixteen = 16.0;
  static const double heightTwenty_Four = 24.0;
  static const double heightThirty_two = 32.0;
  static const double heightFourty_Eight = 48.0;
  static const double screenHorizontal = 16.0;


  // Predefined EdgeInsets
  static const EdgeInsets screenPadding = EdgeInsets.only(
    top: heightFourty_Eight,
    bottom: heightTwenty_Four,
    left: screenHorizontal,
    right: screenHorizontal,
  );

  // Predefined EdgeInsets WithOut Bottom

  static const EdgeInsets screenPaddingWithoutBottom = EdgeInsets.only(
    top: heightFourty_Eight,
    left: screenHorizontal,
    right: screenHorizontal,
  );

  // static const EdgeInsets screenPaddingAll = EdgeInsets.all(screenHorizontal);
  //
  // static const EdgeInsets screenPaddingHorizontal = EdgeInsets.symmetric(
  //   horizontal: screenHorizontal,
  // );
  //
  // static const EdgeInsets screenPaddingVertical = EdgeInsets.symmetric(
  //   vertical: heightTwenty_Four,
  // );


}