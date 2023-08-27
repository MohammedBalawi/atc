import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconScreen extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;
  final Color iconColor;
  const IconScreen({super.key, required this.iconData, required this.text, required this.color, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData,color: iconColor,),
        SizedBox(width: 5,),
        Text(text,style:GoogleFonts.aBeeZee(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black38),),
      ],
    );
  }
}