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
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFE5E5E5),
                  blurRadius: 6.0,
                  spreadRadius: 2.0,
                  offset: Offset(
                    0.0,
                    4.0,
                  )),
            ]),
        child: Column(
          children: [
            IconButton(
                color: const Color(0xFF32B108),
                iconSize: 14,
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
