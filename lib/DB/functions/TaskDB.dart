import 'package:doingly/model/task/TaskModel.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const TaskDBName = 'Transaction_database';

class TaskDB extends ChangeNotifier {
  TaskDB.internal();
  ValueNotifier<List<TaskModel>> taskListNotifier = ValueNotifier([]);

  static TaskDB instance = TaskDB.internal();

  factory TaskDB() {
    return instance;
  }

  Future<void> getAllTask() async {
    final TaskDB = await Hive.openBox<TaskModel>(TaskDBName);
    taskListNotifier.value.clear();

    taskListNotifier.value.addAll(TaskDB.values);

    taskListNotifier.notifyListeners();
  }

  Future<void> insertTransaction(TaskModel obj) async {
    final TaskDB = await Hive.openBox<TaskModel>(TaskDBName);
    await TaskDB.put(obj.id, obj);
    getAllTask();
  }

  // Future<void> deleteTransaction(TaskModel TaskModel) async {
  //   final TaskDB = await Hive.openBox<TaskModel>(TaskDBName);
  //   TaskDB.delete(TaskModel.id);

  //   overViewListNotifier.notifyListeners();
  //   getAllTask();
  // }

  // Future<void> editTransaction(TaskModel value) async {
  //   final TaskDB = await Hive.openBox<TaskModel>(TaskDBName);
  //   TaskDB.put(value.id, value);
  //   overViewListNotifier.notifyListeners();
  //   getAllTask();
  // }
}
