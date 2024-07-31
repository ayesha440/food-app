import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/fav_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<Favorite> _favoriteProducts = [];

  FavoriteProvider() {
    // _loadFavorites();
  }

  List<Favorite> get favoriteProducts => _favoriteProducts;

  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteList = prefs.getStringList('favorites') ?? [];

    _favoriteProducts = favoriteList.map((item) {
      final productData = item.split('|');
      return Favorite(
          productId: productData[0],
          name: productData[1],
          imageUrl: productData[2],
          location: productData[3]);
    }).toList();
    notifyListeners();
    log('favorite data is $_favoriteProducts');
  }

  void toggleFavorite(
      String productId, String name, String location, String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteItem = '$productId|$name|$imageUrl';

    if (_favoriteProducts.any((fav) => fav.productId == productId)) {
      _favoriteProducts.removeWhere((fav) => fav.productId == productId);
      log('value is product remove');
    } else {
      _favoriteProducts.add(Favorite(
          productId: productId,
          location: location,
          name: name,
          imageUrl: imageUrl));
      log('value is product added');
    }

    final favoriteList = _favoriteProducts
        .map((fav) => '${fav.productId}|${fav.name}|${fav.imageUrl}')
        .toList();
    bool isValue = await prefs.setStringList('favorites', favoriteList);
    log('value is $isValue');
    notifyListeners();
  }
}
