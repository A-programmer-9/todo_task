import 'package:flutter/material.dart';
import 'package:todo_task/fetchtodos.dart';
import 'package:todo_task/hometab.dart';
import 'package:todo_task/main.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<dynamic> todos = List.empty();
  int tabIndex = 0;
  List<Widget> tabs = [MyHomePage()];

  Future<List<dynamic>> fetchFromApi() async {
    var todos = await Fetchtodos.fetchData();
    return todos;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            tabs = [HomeTab(todos: snapshot.requireData)];
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: tabIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.house_rounded), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.note_add_rounded), label: "Add"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.note_alt_rounded), label: "TODOs")
                ],
                selectedItemColor: Colors.blue,
                onTap: (value) {
                  setState(() {
                    tabIndex = value;
                  });
                },
              ),
              body: tabs[tabIndex],
            );
          } else {
            return CircularProgressIndicator.adaptive();
          }
        });
  }
}
