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
      'text': "Avec FindMe, demandez et recevez une plaque d’adressage poastal"
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
        body: Center(
      child: Column(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
                height: 400.0,
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
                          height: 10,
                        ),
                        Text(
                          item['text'],
                          style: GoogleFonts.overpass(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
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
                  color: Colors.grey,
                  activeColor: Colors.green,
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
            height: 20,
          ),
          ElevatedButton(
            child: Text(
              "Je cree mon espace",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.green, elevation: 0, shape: StadiumBorder()),
            onPressed: () {},
          ),
          ElevatedButton(
            child: Text(
              "Je me connecte",
              style: TextStyle(color: Colors.green),
            ),
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 1, color: Colors.green),
                primary: Colors.white,
                elevation: 0,
                shape: StadiumBorder()),
            onPressed: () {},
          ),
        ],
      ),
    ));
  }
}
