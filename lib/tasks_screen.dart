import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/add_task_bottom_sheet.dart';
import 'package:todoey/list_item.dart';
import 'package:todoey/task.dart';

class TasksData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(text: "Add your first task"),
  ];

  Task getTask(int i) => _tasks[i];

  int get tasksCount => _tasks.length;

  add(String taskText) {
    _tasks.add(Task(text: taskText));
    notifyListeners();
  }

  setDone(int i, bool done) {
    _tasks[i].done = done;
    notifyListeners();
  }

  delete(int i) {
    _tasks.removeAt(i);
    notifyListeners();
  }
}

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksData(),
      child: Consumer<TasksData>(
        builder: (context, data, child) => Scaffold(
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
                  data.add(taskText);
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
                    "${data.tasksCount} Tasks",
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
                        itemBuilder: (context, i) {
                          Task task = data.getTask(i);
                          return ListItem(
                            text: task.text,
                            done: task.done,
                            onChanged: (done) => data.setDone(i, done),
                            onLongPress: () => data.delete(i),
                          );
                        },
                        itemCount: data.tasksCount,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
