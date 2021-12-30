import 'package:flutter/material.dart';
import 'package:samplesibra/features/home/fruit/model/todo.dart';
import 'package:samplesibra/features/home/fruit/view/fruit_view.dart';

class VBTTodoCard extends StatelessWidget {
  final Todo item;

  const VBTTodoCard({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(flex: 7, child: Image.network("https://picsum.photos/200")),
            Text(
              item.title * 3,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.subtitle1.copyWith(decoration: TextDecoration.underline),
            ),
            Expanded(child: Icon(Icons.check, color: item.completed ? Colors.green : Colors.red)),
            Expanded(child: Text("A")),
          ],
        ),
      ),
    );
  }
}
