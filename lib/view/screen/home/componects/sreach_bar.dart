import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Column searchBar() {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding:
        const EdgeInsets.only(right: 20.0, bottom: 5),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFF161616),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.search,
                color: Color(0xffB8B8B8),
                size: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Search for planets and stars',
                style: GoogleFonts.inter(
                    color: const Color(0xffB8B8B8),
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}
