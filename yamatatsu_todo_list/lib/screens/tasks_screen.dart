import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yamatatsu_todo_list/models/task_data.dart';
import 'package:yamatatsu_todo_list/screens/add_task_screen.dart';
import 'package:yamatatsu_todo_list/widgets/tasks_list.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TextField がkeyboardで隠れる対策　http://bit.ly/2QIZN4A
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            // ここで 引数付きのFunctionを渡しておけば、AddTaskScreenでも使えるのだ！
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      backgroundColor: Colors.greenAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 32, top: 60, right: 32, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Colors.greenAccent,
                    size: 30,
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Todo for Tatsu',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasksCount} Tasks',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              // ListTile に 10 の余白があるかも。
              padding: EdgeInsets.only(left: 22, right: 22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
