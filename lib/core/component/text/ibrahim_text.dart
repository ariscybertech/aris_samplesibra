import 'package:flutter/material.dart';

class IbrahimText extends StatelessWidget {
  final String title;

  const IbrahimText({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title == null ? "Ibrahim" : title);
  }
}
