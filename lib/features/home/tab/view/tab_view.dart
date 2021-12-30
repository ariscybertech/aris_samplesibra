import 'package:flutter/material.dart';
import 'package:samplesibra/features/home/fruit/view/fruit_view.dart';

class VBTabView extends StatefulWidget {
  @override
  _VBTabViewState createState() => _VBTabViewState();
}

class _VBTabViewState extends State<VBTabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.blue,
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          // ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.red,
            shape: CircularNotchedRectangle(),
            notchMargin: 5,
            child: TabBar(
                // on
                tabs: [
                  Tab(
                    text: "Hello",
                  ),
                  Tab(
                    child: FloatingActionButton(
                      onPressed: () {},
                    ),
                  ),
                  Tab(text: "Hello2"),
                  Tab(text: "Hello3"),
                ]),
          ),
          body: TabBarView(children: [
            FruitView(),
            Container(color: Colors.blue),
            Container(color: Colors.green),
            Container(color: Colors.pink),
          ]),
        ));
  }
}
