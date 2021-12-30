import 'package:flutter/material.dart';
import 'package:samplesibra/core/component/text/ibrahim_text.dart';
import 'package:samplesibra/features/_component/text/vbt_text.dart';

class IbrahimButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData icon;

  const IbrahimButton({Key key, this.onPressed, this.title, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
        icon: Icon(icon ?? Icons.ac_unit), label: IbrahimText(title: title), onPressed: onPressed);
  }
}
