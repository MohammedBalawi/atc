
import 'package:flutter/material.dart';

Color parseColor(String hexColorString) {
  // Remove the # symbol if it exists
  if (hexColorString.startsWith('#')) {
    hexColorString = hexColorString.substring(1);
  }

  // Parse the hexadecimal color string to an integer
  int colorValue = int.parse(hexColorString, radix: 16);

  // Add the alpha value (0xFF) to the front of the integer value
  int finalColorValue = 0xFF000000 + colorValue;

  // Create a Color object using the final integer value
  Color color = Color(finalColorValue);

  return color;
}