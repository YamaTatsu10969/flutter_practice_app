import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:yamatatsu_todo_list/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'hogehoge'),
    Task(title: 'fugafuga'),
    Task(title: 'yamayama'),
  ];

  // 変更できないんだって〜。
  UnmodifiableListView<Task> get tasks {
    // こんな風に書くのだ。
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    _tasks.add(Task(title: newTaskTitle));
    // 絶対必要！！！
    notifyListeners();
  }

  void updateCheckBox(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
