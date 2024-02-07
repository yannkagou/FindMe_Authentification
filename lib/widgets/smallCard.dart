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
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        alignment: Alignment.center,
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
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  color: Theme.of(context).colorScheme.primary,
                  iconSize: 25,
                  icon: Icon(
                    theIcon,
                  ),
                  onPressed: () {}),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  text,
                  style: GoogleFonts.overpass(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
