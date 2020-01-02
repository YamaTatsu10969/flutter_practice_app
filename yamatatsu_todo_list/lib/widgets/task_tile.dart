import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.title,
      this.isChecked,
      this.checkboxCallBack,
      this.longPressCallback});
  final bool isChecked;
  final String title;
  final Function checkboxCallBack;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        title,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.greenAccent,
        value: isChecked,
        onChanged: checkboxCallBack,
      ),
    );
  }
}
