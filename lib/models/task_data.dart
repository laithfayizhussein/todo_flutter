import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  // 1- make it privet
  // 2- add dart collection
  // 3- add get method to return the value adding and allow to ues it
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }
  int get takeCount {
    return _tasks.length;
  }
  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  // from task page take there and work on it
  void updateChecker(Task task) {
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
