import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/task_tile.dart';
import 'package:todo_flutter/models/task.dart';
// before provider
import 'package:todo_flutter/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/alert.dart';

//convert stateful to stateless cos i don't need setState here anymore
class TasksList extends StatelessWidget {
  // delete it cos i pass the value though the class
  // final List<Task> tasks;
  // TasksList(this.tasks);
  @override
  Widget build(BuildContext context) {
    //use consumer to make my code shorter
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return TaskTile(
                // taskTitle: widget.tasks[index].name,
                // isChecked: widget.tasks[index].isDone,
                taskTitle: taskData.tasks[index].name,
                //before useing consumer its call by provider.of<TaskData>(context).tasks
                isChecked: taskData.tasks[index].isDone,
                checkboxCallBack: (bool? checkboxState) {
                  // we did this cos we need to update without set state
                  taskData.updateChecker(taskData.tasks[index]);
                  // setState(() {
                  //   // Provider.of<TaskData>(context).tasks[index].toggleDone();
                  //   // widget.tasks[index].toggleDone();
                  // });
                },
                longPressCallback: () {
                  taskData.deleteTask(taskData.tasks[index]);
                },
              );
            },
            // after adding the
            itemCount: taskData.takeCount
            // widget.tasks.length, **before Provider**

            );
      },
    );
  }
}
