import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/cart_item_model.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  CartProvider() {
    loadCartItems();
  }

  Future<void> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItemsString = prefs.getString('cart_items');
    if (cartItemsString != null) {
      final List<dynamic> cartItemsJson = json.decode(cartItemsString);
      _items = cartItemsJson.map((item) => CartItem.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> addItem(CartItem item) async {
    _items.add(item);
    await _saveCartItems();
    notifyListeners();
  }

  Future<void> removeItem(String id) async {
    _items.removeWhere((item) => item.id == id);
    await _saveCartItems();
    notifyListeners();
  }

  Future<void> clearCart() async {
    _items.clear();
    await _saveCartItems();
    notifyListeners();
  }

  Future<void> _saveCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItemsJson = json.encode(_items.map((item) => item.toJson()).toList());
    await prefs.setString('cart_items', cartItemsJson);
  }
}
