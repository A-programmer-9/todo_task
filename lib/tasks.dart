import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/dbHandler.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  Future<List<Map<String, dynamic>>> getTasks() async {
    return await DBHandler.instance.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Widget> getWidgets(List<Map<String, dynamic>> tasks) {
              List<Widget> result = [];

              for (var task in tasks) {
                result.add(Row(
                  children: [
                    Column(
                      children: [
                        Text(task["title"]),
                        Text(task["description"])
                      ],
                    ),
                    IconButton(
                        onPressed: () async {
                          await DBHandler.instance
                              .deleteATodo("Todos", "todo_id", task["todo_id"]);
                        },
                        icon: Icon(Icons.delete_rounded))
                  ],
                ));
              }

              return result;
            }

            List<Map<String, dynamic>> tasks = snapshot.data ?? List.empty();
            return Scaffold(
              appBar: AppBar(title: Text("Tasks")),
              body: ListView(
                children: getWidgets(tasks),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
