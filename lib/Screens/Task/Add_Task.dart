import 'package:doingly/DB/functions/CategoryDB.dart';
import 'package:doingly/DB/functions/TaskDB.dart';
import 'package:doingly/Screens/Task/TaskScreen.dart';

import 'package:doingly/model/task/TaskModel.dart';
import 'package:doingly/widgets/BottomScreen.dart';
import 'package:doingly/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/category/Category_model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

final transactionDB = Hive.box<TaskModel>(TaskDBName);
final categoryDB = Hive.box<CategoryModel>(categoryDBName);

class _AddTaskState extends State<AddTask> {
  DateTime date = DateTime.now();

  CategoryModel? selectedCategoryModel;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController explainController = TextEditingController();

  FocusNode ex = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          backgroundContainer(context),
          // ignore: avoid_unnecessary_containers
          Container(
            //width: screenWidth * 0.9,
            child: SingleChildScrollView(child: mainContainer()),
          )
        ],
      )),
    );
  }

  Container mainContainer() {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      //SizedBox(height: screenHeight * .08),

      /* height: 550,
       width: 340, */

      height: size.height * 0.7,
      width: size.width * 0.9,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            name(),
            const SizedBox(
              height: 20,
            ),
            explain(),
            const SizedBox(
              height: 20,
            ),

            dateTime(),
            const SizedBox(
              height: 50,
            ),
            //const Spacer(),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  AddTask();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => BottomScreen(),
                  ));
                }
              },
              child: button(size.width * 0.30, size.height * 0.06, 'Save', 18),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Container dateTime() {
    return Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Colors.grey)),
        width: 300,
        child: TextButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2100));
            // ignore: unrelated_type_equality_checks
            if (newDate == null) {
              return;
            } else {
              setState(() {
                date = newDate;
              });
            }
          },
          child: Text(
            'Date : ${date.year}/${date.month}/${date.day}',
            style: const TextStyle(
                fontSize: 16,
                //fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        ));
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 300,
        child: TextField(
          focusNode: ex,
          controller: explainController,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'explain',
            labelStyle: const TextStyle(fontSize: 17, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 2, color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 2, color: Colors.green)),
          ),
        ),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
        ),
        child: DropdownButtonFormField<String>(
          items: dropdownitems(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Select Name';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            setState(() {
              //selectedCategoryModel = value;
            });
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> dropdownitems() {
    var boxItems = categoryDB.values.map(
      (item) => DropdownMenuItem<String>(
        //value: selectedCategoryModel,
        value: item.categoryName,
        child: Row(children: [
          const SizedBox(
            width: 7,
          ),
          Text(
            item.categoryName,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
          ),
        ]),
        onTap: () {
          selectedCategoryModel = item;
        },
        //Text(item.name),
      ),
    );
    return boxItems.toList();
  }

  Future AddTask() async {
    if (selectedCategoryModel == null) {
      return;
    }

    final model = TaskModel(
        datetime: date,
        explain: explainController.text,
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        category: selectedCategoryModel!);
    await TaskDB().insertTransaction(model);
    // ignore: use_build_context_synchronously

    TaskDB.instance.getAllTask();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Transaction Added Successfully',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.amber,
      ),
    );
  }
}

Column backgroundContainer(BuildContext context) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: 240,
        decoration: const BoxDecoration(
            color: Color(0xFF84aceb),
            //color: Colors.amber,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 80,
                  ),
                  const Text(
                    'Add Transaction',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
