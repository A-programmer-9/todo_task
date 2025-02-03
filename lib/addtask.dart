import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var titleCon = TextEditingController();
  var descCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Task")),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: titleCon,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descCon,
              decoration: InputDecoration(labelText: "Description"),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child:
                    ElevatedButton(onPressed: () {}, child: Text("Add Task")))
          ],
        ),
      ),
    );
  }
}
