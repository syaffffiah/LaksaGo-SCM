import 'package:flutter/material.dart';

// ---------------------------------------------
// 📌 Custom Search Bar Widget
// ---------------------------------------------
class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String query) onChanged;
  final VoidCallback onFilterPressed;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged, // Trigger search query updates
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            color: const Color(0xFFE67E22),
            onPressed: onFilterPressed, // Open filter modal
          ),
        ],
      ),
    );
  }
}
