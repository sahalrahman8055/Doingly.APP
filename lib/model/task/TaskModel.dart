import 'package:doingly/model/category/Category_model.dart';
import 'package:hive/hive.dart';
 part 'TaskModel.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  CategoryModel category;

  @HiveField(1)
  String explain;

  @HiveField(2)
  DateTime datetime;
  @HiveField(3)
  String id;

  TaskModel(
      {required this.datetime,
      required this.explain,
      required this.id,
      required this.category});

  get int => null;
}
