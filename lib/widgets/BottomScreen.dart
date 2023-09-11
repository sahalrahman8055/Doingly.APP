import 'package:doingly/Screens/HomeScreen.dart';

import 'package:doingly/Screens/Task/TaskScreen.dart';
import 'package:doingly/Screens/category/Add_Category.dart';
import 'package:doingly/Screens/Task/Add_Task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  List<Widget> _pages = [
    HomeScreen(),
    TaskScreen(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  TextEditingController _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[currentIndex],
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Container(
          child: SpeedDial(
            animatedIcon: AnimatedIcons.add_event,
            backgroundColor: Color(0xFF72A6F8),
            children: [
              SpeedDialChild(
                child: Icon(
                  Icons.add_task_outlined,
                  color: Colors.white,
                ),
                backgroundColor: Color(0xFF72A6F8),
                label: 'Add Task',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => AddTask()));
                  ;
                },
              ),
              SpeedDialChild(
                  child: Icon(
                    Icons.category_outlined,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xFF72A6F8),
                  label: 'Add Category',
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddCategory()));
                  }),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
                size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 35,
                color: Colors.grey,
              ),
              label: 'Task',
            ),
          ],
        ),
      ),
    );
  }
}
