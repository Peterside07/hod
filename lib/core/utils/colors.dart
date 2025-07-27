import 'package:flutter/material.dart';

final appColor = HodColors();

class HodColors {
  // HodColors();
  static HodColors? _instance;

  factory HodColors() {
    return _instance ??= HodColors._internal();
  }

  HodColors._internal();

// Primary Colors
  final primary = const Color(0xff151723);
  final primary_800 = const Color(0xff060623);
  final primary_700 = const Color(0xff1A1648);
  final primary_600 = const Color(0xff1A2748);
  final primary_500 = const Color(0xff273472);
  final primary_400 = const Color(0xff6A6AC8);
  final primary_300 = const Color(0xff181818);

  // Secondary Colors
  final secondary = const Color(0xff3A1516);
  final secondary_800 = const Color(0xff660202);
  final secondary_700 = const Color(0xff7A0C0F);
  final secondary_600 = const Color(0xffAB181D);
  final secondary_500 = const Color(0xffD01D22);
  final secondary_400 = const Color(0xffD84F53);
  final secondary_300 = const Color(0xffE09194);

  //neutral colors

  final grey_900 = const Color(0xff212327);
  final grey_800 = const Color(0xff31343B);
  final grey_700 = const Color(0xff535559);
  final grey_600 = const Color(0xff8D8F94);
  final grey_500 = const Color(0xffAFB1B6);
  final grey_200 = const Color(0xffE4E5E7);

  //success colors
  final success = const Color(0xff388F0E);
  final success_800 = const Color(0xffE6FFDA);

  //Error colors
  final error = const Color(0xffEB0108);
  final error_800 = const Color(0xffFFE8E9);

  //Additional Colors
  final additional = const Color(0xffF9A62B);
  final additional_800 = const Color(0xffFCEED9);

  //white and black colors
  final white = const Color(0xffffffff);
  final black = const Color(0xff000000);


}
