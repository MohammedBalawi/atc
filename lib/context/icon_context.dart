import 'package:flutter/material.dart';

class IconContext extends StatelessWidget {
  final IconData icon;
  final Color color ;

  const IconContext({super.key, required this.icon,  required this.color});

  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon ,color: color,),
      ],
    );
  }
}
