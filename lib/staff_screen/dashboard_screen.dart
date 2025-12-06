import 'package:flutter/material.dart';
import '../login_signup/welcomepage.dart';
import 'orders_menu_screen.dart';
import 'menu_screen.dart';
import 'staff_profile_screen.dart';
import '../models/staff_item_screen.dart'; // Import the Staff model

class DashboardScreen extends StatelessWidget {
  final Staff staff; // Add a Staff object to pass to StaffProfileScreen

  const DashboardScreen({super.key, required this.staff});

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Logout Confirmation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Are you sure you want to logout?',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                ); // Redirect to login screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 50,
            ),
            IconButton(
              onPressed: () {
                _showLogoutConfirmation(context);
              },
              icon: const Icon(Icons.logout, color: Colors.brown),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: SingleChildScrollView(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.2,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                final items = [
                  {
                    "icon": Icons.food_bank,
                    "label": "Orders",
                    "screen": const OrdersMenuScreen(),
                  },
                  {
                    "icon": Icons.menu_book,
                    "label": "Menu",
                    "screen": const MenuScreen(),
                  },
                  {
                    "icon": Icons.people,
                    "label": "Profile",
                    "screen": StaffProfileScreen(
                        staff: staff), // Pass the Staff object
                  },
                ];

                return _buildDashboardItem(
                  icon: items[index]["icon"] as IconData,
                  label: items[index]["label"] as String,
                  backgroundColor: const Color(0xFFF87A03),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => items[index]["screen"] as Widget,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardItem({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(
                  0, 0, 0, 0.1), // Replaces withOpacity(0.1)
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 130,
              color: Colors.white,
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(
                        0, 0, 0, 0.15), // Replaces withOpacity(0.15)
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
