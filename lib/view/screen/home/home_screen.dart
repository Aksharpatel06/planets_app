import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:planets_app/utils/global_variable.dart';
import 'package:planets_app/view/controller/home_controller.dart';
import 'package:planets_app/view/screen/details/details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeControllerTrue = Provider.of<HomeController>(context);
    HomeController homeControllerFalse =
        Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xff0e0e0e),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/img/splash/splash_img.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, bottom: 5),
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
                Hero(
                  tag: 'box',
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        homeControllerTrue.planetsList.length,
                        (index) {
                          return SizedBox(
                            height: 345,
                            width: 260,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    child: Container(
                                      height: 250,
                                      width: 220,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(int.parse(homeControllerTrue
                                                    .planetsList[index].color))
                                                .withOpacity(1),
                                            Colors.white,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              homeControllerTrue
                                                  .planetsList[index].name,
                                              style: GoogleFonts.inter(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              homeControllerTrue
                                                  .planetsList[index].description,
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
                                ),
                                Positioned(
                                  right: 80,
                                  child: AnimatedBuilder(
                                      animation: animationController,
                                      child: Container(
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(homeControllerTrue
                                                  .planetsList[index].image),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      builder: (context, child) =>
                                          RotationTransition(
                                            turns: animationController,
                                            child: child,
                                          )),
                                ),
                                Positioned(
                                  top: 305,
                                  left: 110,
                                  child: GestureDetector(
                                    onTap: () {
                                      homeControllerFalse.changePlanetsIndex(index);
                                      Navigator.of(context).push(PageTransition(child: const DetailsScreen(), type: PageTransitionType.leftToRight));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white),
                                        color: Color(int.parse(homeControllerTrue
                                            .planetsList[index].color)),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                  padding:
                      const EdgeInsets.only(right: 20.0, top: 20, left: 10),
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
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(int.parse(homeControllerTrue
                                            .planetsList[7].color))
                                            .withOpacity(1),
                                        Colors.white,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(homeControllerTrue
                                            .planetsList[7].image),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ice giant - Uranus',
                                      style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        'Uranus is a fascinating planet that is often overlooked due to its distance from Earth and lack of visible features.',
                                        maxLines: 3,
                                        style: GoogleFonts.inter(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'By Louise Stark | 12 May 2023',
                                      maxLines: 3,
                                      style: GoogleFonts.inter(
                                          fontSize: 12,
                                          color: const Color(0xff787878)),
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
                              color: Color(int.parse(
                                  homeControllerTrue.planetsList[7].color)),
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
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff696969),
        backgroundColor: const Color(0xff161616),
        showSelectedLabels: false,
        currentIndex: homeControllerTrue.bottomIndex,
        onTap: (value) {
          homeControllerFalse.changeBottomIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Color(0xff161616),
              icon: Icon(Icons.home),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.dataset), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
