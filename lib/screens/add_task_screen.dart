import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  // after using provider class and add void property to him i will delete this two line
  // AddTaskScreen(this.addTaskCallback);
  // final Function addTaskCallback;

  String? newTaskTitle;

  @override
  // here i made to container m
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            )),
        child: Column(
          children: [
            Text(
              'Add Task',
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              cursorWidth: 2,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle!);
                Navigator.pop(context);
              },
              child: Text(
                'Add ',
                style: TextStyle(color: Colors.white),
              ),
              style:
                  TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
            )
          ],
        ),
      ),
    );
  }
}
