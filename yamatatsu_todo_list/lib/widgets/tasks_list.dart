import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yamatatsu_todo_list/models/task_data.dart';
import 'package:yamatatsu_todo_list/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, _) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              title: task.title,
              isChecked: task.isDone,
              checkboxCallBack: (newValue) {
                taskData.updateCheckBox(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}

//class TasksList extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//        itemBuilder: (context, index) {
//          return TaskTile(
//            title: Provider.of(context).tasks[index].title,
//            isChecked: Provider.of(context).tasks[index].isDone,
//            checkboxCallBack: (newValue) {
//              Provider.of(context).tasks[index].toggleDone();
//            },
//          );
//        },
//        itemCount: Provider.of(context).tasks.length);
//  }
//}
