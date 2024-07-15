import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modal/planets_model.dart';

class HomeController extends ChangeNotifier {
  int planetsIndex = 0;
  int bottomIndex = 0;

  HomeController() {
    getData();
  }

  List<PlanetsModel> favoritePlanetsList = [];

  void changeBottomIndex(int index) {
    bottomIndex = index;
    notifyListeners();
  }

  void changePlanetsIndex(int index) {
    planetsIndex = index;
    notifyListeners();
  }

  List<PlanetsModel> planetsList = [];

  Future<void> getData() async {
    String jsonData = await rootBundle.loadString('asset/json/planets.json');
    List json = jsonDecode(jsonData);
    planetsList = json
        .map(
          (e) => PlanetsModel.fromJson(e),
        )
        .toList();
    notifyListeners();
  }

  void addFavoritePlanets() {
    planetsList[planetsIndex].like = !planetsList[planetsIndex].like;
    notifyListeners();
    if (planetsList[planetsIndex].like) {
      favoritePlanetsList.add(planetsList[planetsIndex]);
      notifyListeners();
    } else {
      favoritePlanetsList.remove(planetsList[planetsIndex]);
      notifyListeners();
    }
    print(favoritePlanetsList.length);
    notifyListeners();
  }
}
