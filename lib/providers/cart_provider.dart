import 'package:flutter/material.dart';
import '../models/food_item.dart';

/// A provider for managing the shopping cart.
class CartProvider with ChangeNotifier {
  final List<FoodItem> _cartItems = [];

  /// Get a list of items in the cart.
  List<FoodItem> get cartItems => List.unmodifiable(_cartItems);

  /// Add an item to the cart or increase its quantity if it already exists.
  void addToCart(FoodItem item) {
    final index = _cartItems.indexWhere((cartItem) => cartItem.id == item.id);

    if (index != -1) {
      // If item exists, increase its quantity.
      _cartItems[index] = _cartItems[index].copyWith(
        quantity: _cartItems[index].quantity + 1,
      );
    } else {
      // If item doesn't exist, add a new one with quantity 1.
      _cartItems.add(item.copyWith(quantity: 1));
    }

    notifyListeners();
  }

  /// Remove an item from the cart entirely.
  void removeFromCart(FoodItem item) {
    _cartItems.removeWhere((cartItem) => cartItem.id == item.id);
    notifyListeners();
  }

  /// Increase the quantity of an item in the cart.
  void increaseQuantity(FoodItem item) {
    final index = _cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (index != -1) {
      _cartItems[index] = _cartItems[index].copyWith(
        quantity: _cartItems[index].quantity + 1,
      );
      notifyListeners();
    }
  }

  /// Decrease the quantity of an item in the cart.
  /// If the quantity reaches 1 and is decreased, the item is removed.
  void decreaseQuantity(FoodItem item) {
    final index = _cartItems.indexWhere((cartItem) => cartItem.id == item.id);
    if (index != -1) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index] = _cartItems[index].copyWith(
          quantity: _cartItems[index].quantity - 1,
        );
      } else {
        removeFromCart(item);
      }
      notifyListeners();
    }
  }

  /// Calculate the total price of items in the cart.
  double get totalAmount => _cartItems.fold(
        0.0,
        (sum, item) => sum + (item.price * item.quantity),
      );

  /// Get the total number of items in the cart.
  int get totalItems => _cartItems.fold(
        0,
        (sum, item) => sum + item.quantity,
      );

  /// Clear all items from the cart.
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
