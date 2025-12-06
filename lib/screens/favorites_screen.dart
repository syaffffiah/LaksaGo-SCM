import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../widgets/food_grid.dart';
import '../screens/home_screen.dart'; // Import HomeScreen

class FavoritesScreen extends StatelessWidget {
  final List<FoodItem> favoriteItems;
  final Function(String) onToggleFavorite;

  const FavoritesScreen({
    super.key,
    required this.favoriteItems,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : FoodGrid(
              foodItems: favoriteItems,
              filter: '',
              favorites: favoriteItems.map((item) => item.id).toSet(),
              onToggleFavorite: onToggleFavorite,
            ),
    );
  }
}
