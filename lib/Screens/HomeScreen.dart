import 'package:doingly/Screens/NavBarScreen.dart';
import 'package:doingly/Screens/category/category_tile.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getAllCategory();
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFFCBECDC), Color(0xFFFFFFFF)])),
      child: Scaffold(
        drawer: NavBarScreen(),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/HomeScreen/Logo.png',
                  height: size.height * 0.06,
                  width: size.width * 0.13,
                ),
              ),
            ),
          ],
          backgroundColor: Color(0xFFFBFFFD),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 35,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 95, 152, 243),
                        Color.fromARGB(255, 194, 217, 255),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF518EF0).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Text(
                            'Manage your \ntime well',
                            style: GoogleFonts.spaceGrotesk(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/HomeScreen/note pad.png',
                            // height: size.height * 0.6,
                            // width: size.width * 0.9,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Today’s Pending Tasks',
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                height: size.height * 0.05,
                width: size.width * 0.80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFFDBDBDB), // Set the border color to grey
                    width: 1, // Set the border width
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.radio_button_on_rounded,
                        color: Color(0xFF72A6F8)),
                    SizedBox(
                      width: size.width * 0.10,
                    ),
                    Text('Daily UI Challenge'),
                    SizedBox(
                      width: size.width * 0.19,
                    ),
                    Text(
                      '9.00 am',
                      style: TextStyle(color: Color(0xFF72A6F8), fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                    height: 50,
                  ),
                  Text(
                    'Categories',
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                // height: size.height / 2.7,
                height: 350,
                // color: Colors.amber,
                child: categoryTile(),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

void getAllCategory() {}
