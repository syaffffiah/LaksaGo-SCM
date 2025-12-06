import 'package:flutter/material.dart';
import 'package:home_screen/screens/profile_screen.dart';

import '../models/food_item.dart';
import '../widgets/app_header.dart';
import '../widgets/search_bar.dart';
import '../widgets/category_tabs.dart';
import '../widgets/food_grid.dart';
import '../widgets/bottom_nav_bar.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  String _currentFilter = 'All';
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _favorites = <String>{};
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          _onCategorySelected('All');
          break;
        case 1:
          _onCategorySelected('Popular');
          break;
        case 2:
          _onCategorySelected('Laksa');
          break;
        case 3:
          _onCategorySelected('Bubur');
          break;
      }
    }
  }

  void _onCategorySelected(String category) {
    setState(() {
      _currentFilter = category;
      _searchController.clear();
    });
  }

  void _onSearchChanged(String query) {
    setState(() => _currentFilter = query);
  }

  void _toggleFavorite(String itemId) {
    setState(() {
      // Find the food item based on the itemId
      final foodItem = dummyFoodItems.firstWhere((item) => item.id == itemId);

      // Toggle the favorite status
      foodItem.isFavorite = !foodItem.isFavorite;

      if (_favorites.contains(itemId)) {
        _favorites.remove(itemId);
      } else {
        _favorites.add(itemId);
      }
    });
  }

  List<FoodItem> _getFilteredItems() {
    if (_currentFilter.isEmpty) {
      return dummyFoodItems;
    }
    return dummyFoodItems.where((item) {
      if (_currentFilter == 'All') {
        return true;
      } else if (_currentFilter == 'Popular') {
        return item.rating >= 4.8;
      } else if (['Laksa', 'Bubur'].contains(_currentFilter)) {
        return item.category == _currentFilter;
      }
      return item.name.toLowerCase().contains(_currentFilter.toLowerCase());
    }).toList();
  }

  List<FoodItem> _getFavoriteItems() {
    return dummyFoodItems
        .where((item) => _favorites.contains(item.id))
        .toList();
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = _getFilteredItems();
    final favoriteItems = _getFavoriteItems();

    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeContent(filteredItems),
          FavoritesScreen(
            favoriteItems: favoriteItems,
            onToggleFavorite: _toggleFavorite,
          ),
          const Center(child: Text('Cart Page')), // Cart Page Content
          ProfilePage(), // profile page content
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        favoriteCount: _favorites.length,
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }

  Widget _buildHomeContent(List<FoodItem> items) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AppHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomSearchBar(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onFilterPressed: () {
                // Handle filter press here
              },
            ),
          ),
          CategoryTabs(
            tabController: _tabController,
            onCategorySelected: _onCategorySelected,
          ),
          Expanded(
            child: FoodGrid(
              foodItems: items,
              filter: _currentFilter,
              favorites: _favorites,
              onToggleFavorite: _toggleFavorite,
            ),
          ),
        ],
      ),
    );
  }
}
