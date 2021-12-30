import 'package:flutter/material.dart';
import 'package:samplesibra/features/_component/button/vbt_auth_button.dart';
import 'package:samplesibra/features/_component/card/todo_card.dart';
import 'package:samplesibra/features/home/fruit/model/todo.dart';
import 'package:samplesibra/features/home/fruit/service/todo_service.dart';

class FruitView extends StatefulWidget {
  @override
  _FruitViewState createState() => _FruitViewState();
}

class _FruitViewState extends State<FruitView> {
  int value = 0;
  PageViewsItems item = PageViewsItems.HELLO;
  List<Todo> todos = [];

  bool isLoading = false;

  TodoService todoService = TodoService();
  @override
  void initState() {
    super.initState();
    callItems();
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> callItems() async {
    changeLoading();
    try {
      todos = await todoService.getAllTodos();
      setState(() {});
    } catch (e) {}

    changeLoading();
  }

  List<String> responses = List.generate(10, (index) => index.toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Expanded(child: buildRowItems()),
          Divider(),
          Wrap(
            spacing: 20,
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 20,
                width: 30,
                color: Colors.blue,
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 20,
                width: 50,
                color: Colors.red,
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 20,
                width: 30,
                color: Colors.blue,
              ),
            ],
          ),
          Expanded(
              flex: 9,
              child:
                  AnimatedOpacity(duration: Duration(seconds: 1), opacity: isLoading ? 0 : 1, child: buildListView())),
        ],
      ),
      floatingActionButton: buildVbtAuth(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 3 / 2,
          child: VBTTodoCard(item: todos[index]),
        );
      },
    );
  }

  ListTile buildListTileSamples(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: AspectRatio(aspectRatio: 10 / 5, child: Image.network("https://picsum.photos/200")),
      subtitle: Container(
        color: Colors.red,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("sdf"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03, child: VerticalDivider()),
            Text("sdf"),
            Text("sdf"),
            Text("sdf"),
          ],
        ),
      ),
    );
  }

  Row buildRowItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RaisedButton(
            color: item == PageViewsItems.HELLO ? Colors.green : Colors.white,
            onPressed: () {},
            shape: StadiumBorder()),
        RaisedButton(
            color: item == PageViewsItems.HELLO1 ? Colors.green : Colors.white,
            onPressed: () {},
            shape: StadiumBorder()),
        RaisedButton(
            color: item == PageViewsItems.HELLO2 ? Colors.green : Colors.white,
            onPressed: () {},
            shape: StadiumBorder()),
        RaisedButton(
            color: item == PageViewsItems.HELLO3 ? Colors.green : Colors.white,
            onPressed: () {},
            shape: StadiumBorder()),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: buildVisibility(),
        brightness: Theme.of(context).brightness,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
            onPressed: () {},
          )
        ],
        title: Text(
          "Recipes",
          style: Theme.of(context).textTheme.headline5,
        ));
  }

  Visibility buildVisibility() {
    return Visibility(
        visible: isLoading, child: Padding(padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()));
  }

  PageView buildPageView() {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          this.item = PageViewsItems.values[value];
        });
      },
      children: [
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
        Container(color: Colors.red),
      ],
    );
  }

  VBTAuth buildVbtAuth() {
    return VBTAuth(
      onPressAuth: (token) {
        // ContextExtension/ex
        print(token);
      },
    );
  }
}

enum PageViewsItems {
  HELLO,
  HELLO1,
  HELLO2,
  HELLO3,
}

extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
