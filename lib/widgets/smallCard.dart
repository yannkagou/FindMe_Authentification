import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallCard extends StatelessWidget {
  final IconData theIcon;

  final String text;

  const SmallCard({Key? key, required this.theIcon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
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
            IconButton(
                color: Colors.green,
                iconSize: 24,
                icon: Icon(
                  theIcon,
                ),
                onPressed: () {}),
            Text(
              text,
              style: GoogleFonts.overpass(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
