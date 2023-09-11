import 'package:flutter/material.dart';
import 'package:doingly/DB/functions/CategoryDB.dart';

import '../../model/category/Category_model.dart';

class categoryTile extends StatefulWidget {
  categoryTile({Key? key}) : super(key: key);

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<categoryTile> {
  final CategoryDB _categoryDB = CategoryDB.instance;

  @override
  void initState() {
    super.initState();
    _categoryDB.getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    // getAllCategory();
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: _categoryDB.categoryNotifier,
        builder: (BuildContext ctx, List<CategoryModel> categoryList,
            Widget? child) {
          return ListView.separated(
            itemBuilder: (ctx, id) {
              final data = categoryList[id];
              return Card(
                child: ListTile(
                  title: Text(data.categoryName),
                  trailing: IconButton(
                    onPressed: () {
                      _categoryDB.deleteCategory(data.categoryid);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, id) {
              return const Divider();
            },
            itemCount: categoryList.length,
          );
        },
      ),
    );
  }
}
