import 'package:findme_test/widgets/mainDrawer.dart';
import 'package:findme_test/widgets/smallCard.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CarouselController carouselController;

  List itemsList = [
    {
      'rue': '06 Rue Abdoulaye Seck Marie Parsine',
      'cp': 'CP : 13000',
      'ville': 'Dakar, Sénégal'
    },
    {
      'rue': '077 Rue Elig-essono',
      'cp': 'CP : 11000',
      'ville': 'Yaoundé, Cameroun'
    },
    {'rue': '112 Rue Fouda', 'cp': 'CP : 43000', 'ville': 'Douala, Cameroun'},
  ];

  int currentIndex = 0;

  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: mainDrawer(),
        body: Column(children: [
          Container(
            child: Row(
              children: [
                IconButton(
                    iconSize: 34,
                    icon: const Icon(
                      Icons.notifications_active_outlined,
                    ),
                    onPressed: () {}),
                ElevatedButton(
                  child: Text(
                    "2",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      elevation: 0,
                      shape: StadiumBorder()),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: Image(
                width: 144,
                height: 38,
                image: AssetImage("assets/logo.png"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(children: [
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
                    (item) => Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xE5E5E5),
                                  blurRadius: 6.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(
                                    0.0, // Move to right 0.0 horizontally
                                    2.0, // Move to bottom 2.0 Vertically
                                  )),
                            ]),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    color: Colors.green,
                                    iconSize: 22,
                                    icon: const Icon(
                                      Icons.notifications_active_outlined,
                                    ),
                                    onPressed: () {}),
                                Text(
                                  "Adresse postale à certifier",
                                  style: GoogleFonts.overpass(
                                    textStyle: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              item['rue'],
                              style: GoogleFonts.overpass(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                            ),
                            Text(
                              item['cp'],
                              style: GoogleFonts.overpass(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                            ),
                            Text(
                              item['ville'],
                              style: GoogleFonts.overpass(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        )),
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
          ]),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallCard(theIcon: Icons.share, text: "Partagez mon addresse"),
              SmallCard(theIcon: Icons.info, text: "Informer les Residents"),
              SmallCard(theIcon: Icons.share, text: "Recommander FINDME"),
            ],
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Gerer mon plan de localisation postale",
                  style: GoogleFonts.overpass(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
                IconButton(
                    color: Colors.green,
                    iconSize: 32,
                    icon: Icon(Icons.file_copy_outlined),
                    onPressed: () {}),
              ])),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Commander ma plaque pour certifier mon adresse",
                  style: GoogleFonts.overpass(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
                Image(
                  width: 44,
                  height: 20,
                  image: AssetImage("assets/Plaque.png"),
                ),
              ])),
        ]));
  }
}
