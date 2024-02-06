import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/numeric_keypad.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/dakar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Entrez votre code secret",
                    style: GoogleFonts.overpass(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    controller: textController,
                    keyboardType: TextInputType.none,
                  ),
                  NumericKeypad(
                    controller: textController,
                  ),
                  Text(
                    "Code secret oublié ?",
                    style: GoogleFonts.overpass(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
