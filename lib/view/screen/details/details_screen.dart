import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planets_app/view/controller/home_controller.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeControllerTrue = Provider.of<HomeController>(context);
    HomeController homeControllerFalse =
        Provider.of<HomeController>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xff0e0e0e),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/img/splash/splash_img.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xffC9C9C9)),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xffC9C9C9),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: Center(
                      child: Hero(
                        tag: 'box',
                        // child: Image.asset(
                        //   homeControllerTrue
                        //       .planetsList[homeControllerTrue.planetsIndex]
                        //       .image,
                        //   fit: BoxFit.cover,
                        // ),
                        child: SizedBox(
                          height: 500,
                          width: 500,
                          child: BabylonJSViewer(
                            src: homeControllerTrue
                                .planetsList[homeControllerTrue.planetsIndex].img,
                          ),
                        ),
                        //,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 450,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Color(0xff161616),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                homeControllerTrue
                                    .planetsList[homeControllerTrue.planetsIndex]
                                    .name,
                                style: GoogleFonts.inter(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  homeControllerFalse.addFavoritePlanets();
                                },
                                child: Icon(
                                  (homeControllerTrue
                                          .planetsList[
                                              homeControllerTrue.planetsIndex]
                                          .like)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  shadows: const [
                                    Shadow(
                                        color: Colors.red,
                                        blurRadius: 20,
                                        offset: Offset(0.5, 0.5))
                                  ],
                                  color: Colors.redAccent,
                                  size: 33,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'The Jewel of the Solar System',
                            style: GoogleFonts.inter(
                                fontSize: 20, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            homeControllerTrue
                                .planetsList[homeControllerTrue.planetsIndex]
                                .description,
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                height: 1.5,
                                color: const Color(0xffBFBFBF)),
                          ),
                        ],
                      ),
                      Text(
                        'By Louise Stark | 12 May 2023',
                        maxLines: 3,
                        style: GoogleFonts.inter(
                            fontSize: 12, color: const Color(0xff787878)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
