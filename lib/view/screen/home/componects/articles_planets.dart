import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

Column articlesPlanets(HomeController homeControllerTrue) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'Articles',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            right: 20.0, top: 20, left: 10),
        child: SizedBox(
          height: 165,
          child: Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff161616),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.only(
                              topLeft:
                              Radius.circular(10),
                              bottomLeft:
                              Radius.circular(10)),
                          gradient: LinearGradient(
                            colors: [
                              Color(int.parse(
                                  homeControllerTrue
                                      .planetsList[7]
                                      .color))
                                  .withOpacity(1),
                              Colors.white,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                  homeControllerTrue
                                      .planetsList[7].image),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ice giant - Uranus',
                            style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 182,
                            child: Text(
                              'Uranus is a fascinating planet that is often overlooked due to its distance from Earth and lack of visible features.',
                              maxLines: 3,
                              style: GoogleFonts.inter(
                                  fontSize: 11,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'By Louise Stark | 12 May 2023',
                            maxLines: 3,
                            style: GoogleFonts.inter(
                                fontSize: 10,
                                color:
                                const Color(0xff787878)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    color: Color(int.parse(homeControllerTrue
                        .planetsList[7].color)),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
