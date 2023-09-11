import 'package:doingly/widgets/BottomScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF76FFBD), Color(0xFFFFFFFF)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.18,
                ),
                Container(
                  child: Text(
                    'Doingly',
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 3,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.4,
                ),
                Container(
                  height: 50, // Specify the desired height
                  width: 240, // Specify the desired width
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Username..',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13, // Adjust the font size as needed
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                NeoPopTiltedButton(
                  isFloating: true,
                  onTapUp: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => BottomScreen()));
                  },
                  decoration: NeoPopTiltedButtonDecoration(
                    color: Color(0xFF76FFBD),
                    plunkColor: Color(0xFF76FFBD),
                    shadowColor: Color.fromRGBO(36, 36, 36, 1),
                    showShimmer: true,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60.0,
                      vertical: 10,
                    ),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
