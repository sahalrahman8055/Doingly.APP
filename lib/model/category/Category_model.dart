import 'package:hive/hive.dart';
part 'Category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String categoryName;

  @HiveField(1)
  final bool isDeleted;
  @HiveField(2)
  final String categoryid;

  CategoryModel(
      {required this.categoryName,
      required this.categoryid,
      this.isDeleted = false});
}
