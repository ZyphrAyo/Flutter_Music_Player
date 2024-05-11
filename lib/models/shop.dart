import 'package:flutter/material.dart';
import 'food.dart';

class Shop with ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
      name: "Salmon Sushi",
      price: "210.00/-",
      imagePath: "lib/images/salmon.png",
      rating: "4.9",
    ),
    Food(
      name: "Tuna Sushi",
      price: "410.00/-",
      imagePath: "lib/images/su.png",
      rating: "4.9",
    ),
    Food(
      name: "Roe Sushi",
      price: "310.00/-",
      imagePath: "lib/images/roe.png",
      rating: "5",
    ),
  ];
  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    if (quantity > 0) {
      for (int i = 0; i < quantity; i++) {
        _cart.add(foodItem);
      }
      notifyListeners();
    }
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
