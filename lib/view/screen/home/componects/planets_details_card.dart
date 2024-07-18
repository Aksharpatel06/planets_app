import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

Align planetsDetailsCard(HomeController homeControllerTrue, int index) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(
          bottom: 20.0),
      child: Container(
        height: 250,
        width: 220,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Color(int.parse(
                  homeControllerTrue
                      .planetsList[
                  index]
                      .color))
                  .withOpacity(1),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding:
          const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            mainAxisAlignment:
            MainAxisAlignment.end,
            children: [
              Text(
                homeControllerTrue
                    .planetsList[index]
                    .name,
                style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight:
                    FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                homeControllerTrue
                    .planetsList[index]
                    .description,
                maxLines: 4,
                style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
