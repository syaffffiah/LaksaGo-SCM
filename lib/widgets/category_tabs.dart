import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final TabController tabController;
  final Function(String category) onCategorySelected;

  const CategoryTabs({
    super.key,
    required this.tabController,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.orange,
      labelColor: Colors.orange,
      unselectedLabelColor: Colors.grey,
      tabs: const [
        Tab(text: 'All'),
        Tab(text: 'Popular'),
        Tab(text: 'Laksa'),
        Tab(text: 'Bubur'),
      ],
      onTap: (index) {
        // Notify the parent widget about the selected category
        String selectedCategory;
        switch (index) {
          case 1:
            selectedCategory = 'Popular';
            break;
          case 2:
            selectedCategory = 'Laksa';
            break;
          case 3:
            selectedCategory = 'Bubur';
            break;
          default:
            selectedCategory = 'All';
        }
        onCategorySelected(selectedCategory);
      },
    );
  }
}
