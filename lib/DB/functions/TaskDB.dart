import 'package:doingly/model/task/TaskModel.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../model/task/TaskModel.dart';

const TaskDBName = 'Transaction_database';

class TaskDB extends ChangeNotifier {
  TaskDB.internal();

  static TaskDB instance = TaskDB.internal();

  factory TaskDB() {
    return instance;
  }
  ValueNotifier<List<TaskModel>> transactionListNotifier = ValueNotifier([]);

  Future<void> getAllTransactions() async {
    final TaskDB = await Hive.openBox<TaskModel>(TaskDBName);
    transactionListNotifier.value.clear();

    transactionListNotifier.value.addAll(TaskDB.values);

    transactionListNotifier.notifyListeners();
  }

  Future<void> insertTransaction(TaskModel obj) async {
    final TaskDB = await Hive.openBox<TaskModel>(TaskDBName);
    await TaskDB.put(obj.id, obj);
    getAllTransactions();
  }

  // Future<void> deleteTransaction(TaskModel TaskModel) async {
  //   final TaskDB = await Hive.openBox<TaskModel>(TaskDBName);
  //   TaskDB.delete(TaskModel.id);

  //   overViewListNotifier.notifyListeners();
  //   getAllTransactions();
  // }

  // Future<void> editTransaction(TaskModel value) async {
  //   final TaskDB = await Hive.openBox<TaskModel>(TaskDBName);
  //   TaskDB.put(value.id, value);
  //   overViewListNotifier.notifyListeners();
  //   getAllTransactions();
  // }
}
