import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {

  final double marginEnd;
  final bool selected;


  PageViewIndicator({this.marginEnd = 0,required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 5,
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: selected ? Colors.amber.shade600 : Colors.grey.shade500,
      ),
    );
  }
}
