import 'dart:math';

import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF76DCF3);
Color accentColor = const Color(0xFF07993A);
Color cardsBg = const Color(0x6F6BA3B0);
Color bgroundColor = const Color(0xEF232323);
Color white = const Color(0xFFDEFBFF);
var randColorsList = [
  const Color(0xFF17A305),
  const Color(0xD2790BB0),
  const Color(0xC8A90505),
  const Color(0xFF6C9312),
  const Color(0x97210383),
];

Color getRandColor() {
  var randColor = randColorsList[Random().nextInt(randColorsList.length)];
  return randColor;
}
