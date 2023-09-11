import 'package:doingly/DB/functions/TaskDB.dart';
import 'package:doingly/model/task/TaskModel.dart';
import 'package:flutter/material.dart';
import 'package:doingly/DB/functions/TaskDB.dart';

import '../../model/category/Category_model.dart';

class Todo_til extends StatefulWidget {
  Todo_til({Key? key}) : super(key: key);

  @override
  _Todo_tilState createState() => _Todo_tilState();
}

class _Todo_tilState extends State<Todo_til> {
  final TaskDB _taskDB = TaskDB.instance;

  @override
  void initState() {
    super.initState();
    _taskDB.getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    // getAllTask();
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: _taskDB.taskListNotifier,
        builder: (BuildContext ctx, List<TaskModel> taskList, Widget? child) {
          return ListView.separated(
            itemBuilder: (ctx, id) {
              final data = taskList[id];
              return Card(
                child: ListTile(
                  title: Text(data.explain),
                  trailing: IconButton(
                    onPressed: () {
                      // _taskDB.deleteCategory(data.categoryid);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, id) {
              return const Divider();
            },
            itemCount: taskList.length,
          );
        },
      ),
    );
  }
}
