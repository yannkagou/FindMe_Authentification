import 'package:findme_test/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late CarouselController carouselController;
  late CarouselController carouselController2;

  List itemsList = [
    {
      'image': 'assets/besoin adresse 1.png',
      'text':
          "Avec FindMe, générez l’adresse postale de votre domicile ou entreprise en 2 minutes"
    },
    {
      'image': 'assets/besoin adresse 1.png',
      'text': "Avec FindMe, obtenez votre plan de localisation postal certifié"
    },
    {
      'image': 'assets/Page1_image 1.png',
      'text': "Avec FindMe, demandez et recevez une plaque d’adressage postal"
    },
  ];

  int currentIndex = 0;
  int currentIndex2 = 0;

  @override
  void initState() {
    carouselController = CarouselController();
    carouselController2 = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Rectangle.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
              items: itemsList
                  .map(
                    (item) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(item['image']),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            item['text'],
                            style: GoogleFonts.overpass(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  height: 2),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                  )
                  .toList(),
            ),
            DotsIndicator(
                dotsCount: itemsList.length,
                position: currentIndex,
                decorator: DotsDecorator(
                    spacing: const EdgeInsets.symmetric(horizontal: 10.0),
                    color: const Color(0xFFCCCCCC),
                    activeColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    size: const Size(13, 13),
                    activeSize: const Size(13, 13)),
                onTap: (index) {
                  carouselController.animateToPage(index);
                }),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    primary: Theme.of(context).colorScheme.primary,
                    elevation: 0,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    "Je crée mon espace",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      side: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.primary),
                      primary: Colors.white,
                      elevation: 0,
                      shape: const StadiumBorder()),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    "Je me connecte",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
