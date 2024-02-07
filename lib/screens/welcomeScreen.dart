import 'package:findme_test/screens/homeScreen.dart';
import 'package:findme_test/widgets/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'SN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: mainDrawer(),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Rectangle.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      width: 130,
                      height: 60,
                      image: AssetImage("assets/logo.png"),
                    ),
                    Builder(
                      builder: (context) => IconButton(
                        color: Theme.of(context).colorScheme.secondary,
                        iconSize: 44,
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Bienvenue 😊 !",
                style: GoogleFonts.overpass(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Mon adresse postale, mon plan de localisation postal en 2 mins",
                  style: GoogleFonts.overpass(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFFF3F7FE),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFE5E5E5),
                              blurRadius: 6.0,
                              spreadRadius: 2.0,
                              offset: Offset(
                                0.0,
                                2.0,
                              )),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "Entrez votre numéro de téléphone",
                                style: GoogleFonts.overpass(
                                  textStyle: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    height: 1.5,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0xFFCCCCCC),
                                          blurRadius: 0.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(
                                            0.0,
                                            3.0,
                                          )),
                                    ]),
                                child: InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    setState(() {
                                      phoneNumber = number;
                                    });
                                  },
                                  selectorConfig: const SelectorConfig(
                                      selectorType:
                                          PhoneInputSelectorType.DROPDOWN),
                                  ignoreBlank: false,
                                  initialValue: phoneNumber,
                                  textFieldController: TextEditingController(),
                                  formatInput: false,
                                  inputDecoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14.0, vertical: 18.0),
                                    border: InputBorder.none,
                                    hintText: '77 851 14 98',
                                    hintStyle:
                                        TextStyle(color: Color(0xFFCCCCCC)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 60),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0, vertical: 15.0),
                                  primary:
                                      Theme.of(context).colorScheme.primary,
                                  elevation: 0,
                                  shape: const StadiumBorder()),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                );
                              },
                              child: Text(
                                "Continuer",
                                style: GoogleFonts.overpass(
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
