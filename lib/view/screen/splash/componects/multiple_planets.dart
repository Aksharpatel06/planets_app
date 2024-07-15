import 'package:flutter/material.dart';

SizedBox multiplePlanets() {
  return SizedBox(
    height: 480,
    width: double.infinity,
    child: Stack(
      children: [
        Positioned(
          right: 330,
          top: 80,
          child: SizedBox(
              height: 150,
              child: Image.asset(
                  'asset/img/planets/Mercury-removebg-preview.png')),
        ),
        Positioned(
          left: 230,
          top: 310,
          child: SizedBox(
              height: 280,
              child: Image.asset(
                'asset/img/planets/Mercury__1_-removebg-preview.png',
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          top: 360,
          child: SizedBox(
              height: 120,
              child: Image.asset(
                  'asset/img/planets/Property_1_Frame_37558-removebg-preview.png')),
        ),
        Center(
            child: SizedBox(
                height: 270,
                child: Image.asset(
                  'asset/img/planets/Venus__3_-removebg-preview.png',
                  fit: BoxFit.cover,
                ))),
        Positioned(
            left: 280,
            child: SizedBox(
                height: 120,
                child: Image.asset(
                    'asset/img/planets/Venus__1_-removebg-preview.png'))),
      ],
    ),
  );
}
