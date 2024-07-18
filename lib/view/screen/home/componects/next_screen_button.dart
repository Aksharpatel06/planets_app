import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../controller/home_controller.dart';
import '../../details/details_screen.dart';

Positioned nextButton(HomeController homeControllerFalse, int index, BuildContext context, HomeController homeControllerTrue) {
  return Positioned(
    top: 305,
    left: 110,
    child: GestureDetector(
      onTap: () {
        homeControllerFalse
            .changePlanetsIndex(index);
        Navigator.of(context).push(
            PageTransition(
                duration: const Duration(
                    milliseconds: 500),
                child:
                const DetailsScreen(),
                type: PageTransitionType
                    .rightToLeft));
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white),
          color: Color(int.parse(
              homeControllerTrue
                  .planetsList[index]
                  .color)),
        ),
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    ),
  );
}
