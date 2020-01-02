import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yamatatsu_todo_list/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.only(top: 32, left: 32, right: 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 32,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                newTaskTitle = newValue;
              },
            ),
            SizedBox(
              height: 16,
            ),
            Flexible(
              child: FlatButton(
                onPressed: () {
                  print(newTaskTitle);
                  if (newTaskTitle == null || newTaskTitle == "") {
                    Navigator.pop(context);
                    return;
                  }
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                color: Colors.greenAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
