import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../home/home_screen.dart';

Padding introTextAndButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 40.0, left: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Explore the Universe',
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 42),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Journey through the cosmos \nwith our space app',
          style: GoogleFonts.inter(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: const HomeScreen(),
                    type: PageTransitionType.bottomToTop));
          },
          child: Container(
            width: 174,
            height: 47,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x26FFFFFF),
                  blurRadius: 60,
                  offset: Offset(0, 16),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 16,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
