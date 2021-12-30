import 'package:flutter/material.dart';
import 'package:samplesibra/features/home/fruit/view/fruit_view.dart';

import 'features/home/tab/view/tab_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: VBTabView(),
    );
  }
}
