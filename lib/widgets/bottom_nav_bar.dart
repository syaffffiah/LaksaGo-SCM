import 'package:flutter/material.dart';
import 'package:home_screen/screens/cart_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final int favoriteCount;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.favoriteCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 2) {
          // Only navigate to CartScreen when the Cart icon is tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        } else {
          onTap(index);
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFE67E22),
      unselectedItemColor: Colors.grey,
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Badge(
            label: Text(favoriteCount.toString()),
            child: const Icon(Icons.favorite),
          ),
          label: 'Favorites',
        ),
        const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: 'Cart'),
        const BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
