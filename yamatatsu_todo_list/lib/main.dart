import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yamatatsu_todo_list/models/task_data.dart';
import 'package:yamatatsu_todo_list/screens/tasks_screen.dart';

void main() => runApp(YamatatsuTodoList());

class YamatatsuTodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider を用いることで全体に通知を送信できる。
    // おそらく、この配下全てに。
    return ChangeNotifierProvider(
      // builder ではなくなっている。create になってる。
      // ここが宣言する場所。監視対象。
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
