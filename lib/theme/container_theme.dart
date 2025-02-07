import 'package:flutter/material.dart';

class ContainerTheme {
  static containerInputData(Widget child, double width) => Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 1),
        width: width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
        child: child,
      );
}
