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
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Rectangle.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(
                        builder: (context) => IconButton(
                          color: Theme.of(context).colorScheme.secondary,
                          iconSize: 44,
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                      ),
                      Stack(
                        children: [
                          IconButton(
                              color: Theme.of(context).colorScheme.secondary,
                              iconSize: 44,
                              icon: const Icon(
                                Icons.notifications_active_outlined,
                              ),
                              onPressed: () {}),
                          Positioned(
                            top: 0.0,
                            right: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(6.0),
                                child: const Text(
                                  "2",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Image(
                  width: 144,
                  height: 38,
                  image: AssetImage("assets/logo.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                        height: 120.0,
                        viewportFraction: 0.8,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),
                    items: itemsList
                        .map(
                          (item) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
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
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 6.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                            padding: EdgeInsets.only(top: 6.0),
                                            alignment: Alignment.topLeft,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            iconSize: 30,
                                            icon: const Icon(
                                              Icons.home,
                                            ),
                                            onPressed: () {}),
                                        Text(
                                          "Adresse postale à certifier",
                                          style: GoogleFonts.overpass(
                                            textStyle: const TextStyle(
                                              color: Color(0xFFE31B23),
                                              fontSize: 16,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      item['cp'],
                                      style: GoogleFonts.overpass(
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      item['ville'],
                                      style: GoogleFonts.overpass(
                                        textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 30,
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
                ]),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SmallCard(
                          theIcon: Icons.share,
                          text: "Partagez \nmon addresse"),
                      SmallCard(
                          theIcon: Icons.info,
                          text: "Informer \nles Residents"),
                      SmallCard(
                          theIcon: Icons.share, text: "Recommander \nFINDME"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Gerer mon plan de \nlocalisation postale",
                                style: GoogleFonts.overpass(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              IconButton(
                                  color: Colors.white,
                                  iconSize: 32,
                                  icon: const Icon(Icons.file_copy_outlined),
                                  onPressed: () {}),
                            ]),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Commander ma plaque \npour certifier mon adresse",
                                style: GoogleFonts.overpass(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const Image(
                                width: 44,
                                height: 31,
                                image: AssetImage("assets/Plaque.png"),
                              ),
                            ]),
                      )),
                ),
              ]),
            ),
          ),
        ));
  }
}
