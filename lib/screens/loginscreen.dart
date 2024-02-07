import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/numericKeypad.dart';

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
            height: 200,
            decoration: const BoxDecoration(
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
                          color: Color(0xFF1665AE)),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: 200,
                    child: PinCodeTextField(
                      controller: textController,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      autoFocus: true,
                      appContext: context,
                      length: 4,
                      pinTheme: PinTheme(
                        activeColor: Colors.black26,
                        activeFillColor: Colors.black26,
                        inactiveColor: Colors.black26,
                        disabledColor: Colors.black26,
                        selectedFillColor: Colors.black26,
                        inactiveFillColor: Colors.black26,
                        selectedColor: Colors.black26,
                        errorBorderColor: Colors.black26,
                        borderWidth: 1.0,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                      keyboardType: TextInputType.none,
                    ),
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
                          color: Color(0xFF1665AE)),
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
