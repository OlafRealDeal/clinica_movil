
import 'package:flutter/material.dart';

class StyleTextRich extends StatelessWidget {
  String? title;
  String? subtitle;
  double? fontSizeTitle;
  double? fontSizeSubtitle;

  StyleTextRich({this.title, this.subtitle, this.fontSizeTitle, this.fontSizeSubtitle});

  @override

  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(fontSize: fontSizeTitle, fontWeight: FontWeight.bold)
          ),

          TextSpan(
            text: subtitle,
            style: TextStyle(fontSize: fontSizeSubtitle)
          )
        ]
      )
    );
  }

}