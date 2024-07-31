import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/cart_item_model.dart';

Future<void> addToCart(CartItem item) async {
  final prefs = await SharedPreferences.getInstance();

  // Retrieve the current cart from SharedPreferences
  List<String>? cartJson = prefs.getStringList('cart');
  List<CartItem> cart = cartJson != null
      ? cartJson.map((json) => CartItem.fromJson(jsonDecode(json))).toList()
      : [];

  // Add the new item to the cart
  cart.add(item);

  // Save the updated cart back to SharedPreferences
  List<String> updatedCartJson = cart.map((item) => jsonEncode(item.toJson())).toList();
  await prefs.setStringList('cart', updatedCartJson);
}

class CartManager {
  static const String cartKey = 'cart_items';

  // Function to add or remove item from the cart
  static Future<void> toggleCartItem(String item) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> cartItems = prefs.getStringList(cartKey) ?? [];

    if (cartItems.contains(item)) {
      cartItems.remove(item);
    } else {
      cartItems.add(item);
    }

    await prefs.setStringList(cartKey, cartItems);
  }

  // Function to check if the item is in the cart
  static Future<bool> isItemInCart(String item) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> cartItems = prefs.getStringList(cartKey) ?? [];
    return cartItems.contains(item);
  }
}