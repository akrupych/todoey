import 'package:flutter/material.dart';
import 'package:todoey/add_task_bottom_sheet.dart';
import 'package:todoey/list_item.dart';
import 'package:todoey/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
      theme: ThemeData.light().copyWith(
        canvasColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TasksScreen extends StatefulWidget {
  final List<Task> tasks = [
    Task(text: "Add your first task"),
  ];

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddTaskBottomSheet(),
            ).then((taskText) {
              setState(() {
                widget.tasks.add(Task(text: taskText));
              });
            });
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30).copyWith(top: 60),
              child: CircleAvatar(
                child: Icon(
                  Icons.list,
                  color: Colors.greenAccent,
                  size: 40,
                ),
                backgroundColor: Colors.white,
                radius: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Todoey",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 30),
              child: Text(
                "${widget.tasks.length} Tasks",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                  child: ListView.builder(
                    itemBuilder: (context, i) => ListItem(
                      text: widget.tasks[i].text,
                      done: widget.tasks[i].done,
                      onChanged: (done) => setState(() {
                        widget.tasks[i].done = done;
                      }),
                    ),
                    itemCount: widget.tasks.length,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
