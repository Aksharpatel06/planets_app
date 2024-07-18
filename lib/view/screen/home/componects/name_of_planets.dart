import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/global_variable.dart';

Column nameOfPlanets() {
  return Column(
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            namePlanets.length,
                (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: (index == 0)
                          ? Colors.white
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xff565656),
                      )),
                  child: Text(
                    namePlanets[index],
                    style: GoogleFonts.inter(
                        color: (index == 0)
                            ? Colors.black
                            : const Color(0xff565656),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
