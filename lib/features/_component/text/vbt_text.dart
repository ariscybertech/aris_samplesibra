import 'package:flutter/material.dart';
import 'package:samplesibra/core/component/text/ibrahim_text.dart';

class VBTText extends StatelessWidget {
  final VBT data;

  const VBTText({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IbrahimText(
      title: data.name,
    );
  }
}

class VBT {
  String name;
}
