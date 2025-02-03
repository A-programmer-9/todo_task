import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  List<dynamic> todos;
  HomeTab({super.key, required this.todos});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ListView(
        children: [
          if (widget.todos.isEmpty) Text("No data"),
          if (widget.todos.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getWidgetsFromTodos(widget.todos),
            )
        ],
      ),
    );
  }

  List<Widget> getWidgetsFromTodos(List<dynamic> todos) {
    List<Widget> result = [];
    int counter = 0;
    for (var todo in todos) {
      counter++;
      result.add(Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title",
              style: TextStyle(fontSize: 20),
            ),
            Text("To Do $counter"),
            Text("Description", style: TextStyle(fontSize: 20)),
            Text(todo["title"])
          ],
        ),
      ));
    }

    return result;
  }
}
