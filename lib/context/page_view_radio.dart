import 'package:flutter/material.dart';

class PageViewRadio extends StatelessWidget {

  final double marginEnd;
  final bool selected;


  PageViewRadio({this.marginEnd = 0,required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? Colors.amber.shade600 : Colors.grey.shade500,
      ),
    );
  }
}
