import 'package:flutter/material.dart';

///Extension for  media query size
extension MediaQueryExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}
