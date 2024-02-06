import 'package:findme_test/screens/homeScreen.dart';
import 'package:findme_test/widgets/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: mainDrawer(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Image(
                width: 100,
                height: 27,
                image: AssetImage("assets/logo.png"),
              ),
            ),
            Text(
              "Bienvenue 😊 !",
              style: GoogleFonts.overpass(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Mon adresse postale, mon plan de localisation postal en 2 mins",
              style: GoogleFonts.overpass(
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xF3F7FE),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Entrez votre numéro de téléphone",
                        style: GoogleFonts.overpass(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        child: Text(
                          "Continuer",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            elevation: 0,
                            shape: StadiumBorder()),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
