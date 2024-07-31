import 'package:flutter/cupertino.dart';

import '../models/restaurent/restaurent_model.dart';

class Foodprovider with ChangeNotifier {
  List<RestaurentModel> restarents = [];

  addRestaurent() {
    restarents.add(RestaurentModel(
      name: "Kfc",
      category: "food",
      deliveryTime: "15 min",
      hmRatings: 0,
      id: "rest1",
      location: "Karachi",
      logoImage: "assets/images/kfclogo.png",
      ratings: 0,
      restaurentImage: "assets/images/kfcimg.png",
    ));
    restarents.add(RestaurentModel(
      name: "Macdonald",
      category: "food",
      deliveryTime: "15 min",
      hmRatings: 0,
      id: "rest2",
      location: "Karachi",
      logoImage: "assets/images/Logo.png",
      ratings: 0,
      restaurentImage: "assets/images/meal.png",
    ));
    notifyListeners();
  }
}
