import 'package:flutter/material.dart';

import '../../../controller/home_controller.dart';

Positioned imagePlanet(HomeController homeControllerTrue, int index,AnimationController animationController) {
  return Positioned(
    right: 80,
    child: AnimatedBuilder(
        animation: animationController,
        child: Hero(
          tag: 'box',
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                  AssetImage(homeControllerTrue.planetsList[index].image),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        builder: (context, child) => RotationTransition(
          turns: animationController,
          child: child,
        )),
  );
}
