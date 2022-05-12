import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:todo_flutter/screens/add_task_screen.dart';
import 'package:todo_flutter/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task.dart';

//convert stateful to stateless cos i don't need setState here anymore
class TasksScreen extends StatelessWidget {
  static const String id = 'TasksScreen';
  // when use provider i move it to sprite page
  // to put it inside a change notifier
  // List<Task> tasks = [
  //   Task(name: 'laith'),
  //   Task(name: 'laith'),
  // ];

  Widget buildButtomSheet(BuildContext context) {
    return AddTaskScreen(
        //newTaskTitle // it was passing to the obj
        // setState(() {
        //   // tasks.add(Task(name: newTaskTitle));
        //   // Navigator.pop(context);
        // });
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //  use widget to run something in the same page
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: buildButtomSheet,
            );
          },
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(Icons.add),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 60, left: 30, right: 30.0, bottom: 30.0),
              child: Column(
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'MY Task',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    ' ${Provider.of<TaskData>(context).takeCount}  Task ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20.0)),
                ),
                child: TasksList(), // tasks //delete the passing value
              ),
            )
          ],
        ));
  }
}
