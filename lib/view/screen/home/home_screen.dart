import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planets_app/utils/global_variable.dart';
import 'package:planets_app/view/controller/home_controller.dart';
import 'package:provider/provider.dart';

import 'componects/articles_planets.dart';
import 'componects/favorite_list_planets.dart';
import 'componects/name_of_planets.dart';
import 'componects/next_screen_button.dart';
import 'componects/planets_details_card.dart';
import 'componects/sreach_bar.dart';

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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: (homeControllerTrue.bottomIndex == 2)
                  ? favoriteListPlanets(
                      homeControllerTrue, context, homeControllerFalse)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        searchBar(),
                        nameOfPlanets(),
                        SingleChildScrollView(
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
                                      planetsDetailsCard(
                                          homeControllerTrue, index),
                                      Positioned(
                                        right: 80,
                                        child: BabylonJSViewer(
                                          src: homeControllerTrue
                                              .planetsList[index].img,
                                        ),
                                      ),
                                      // imagePlanet(homeControllerTrue, index),
                                      nextButton(homeControllerFalse, index,
                                          context, homeControllerTrue),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        articlesPlanets(homeControllerTrue),
                      ],
                    ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBarBubble(
        backgroundColor: const Color(0xff161616),
        color: Colors.white,
        onSelect: (value) {
          homeControllerTrue.changeBottomIndex(value);
        },
        selectedIndex: homeControllerTrue.bottomIndex,
        items: [
          BottomBarItem(
            iconData: Icons.home,
          ),
          BottomBarItem(iconData: Icons.dataset),
          BottomBarItem(iconData: Icons.favorite_border),
          BottomBarItem(iconData: Icons.person),
        ],
      ),
    );
  }
}
