import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallBack;
  final Function() longPressCallback;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallBack,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
          // this is local state
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkboxCallBack
          // onChanged:
          ),
    );
  }
}

// the error when passing Function as property not working
//final Function(bool?) checkboxCallFunction; doing this

// global state effect more than one element like the checkbox and the text
