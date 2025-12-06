import '../staff_screen/active_orders_screen.dart';
import '../staff_screen/incoming_orders_screen.dart';
import '../staff_screen/orders_history_screen.dart';
import 'package:flutter/material.dart';

class OrdersMenuScreen extends StatelessWidget {
  const OrdersMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
          color: Colors.orange,
        ),
        title: const Text(
          'Orders',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildNavigationCard(
              context: context,
              title: 'Incoming Orders',
              icon: Icons.notifications_active_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IncomingOrdersScreen()),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildNavigationCard(
                context: context,
                title: 'Active Orders',
                icon: Icons.room_service_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ActiveOrdersScreen()),
                  ); //NAVIGATION
                }),
            const SizedBox(height: 16),
            _buildNavigationCard(
                context: context,
                title: 'Orders History',
                icon: Icons.receipt_long_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrdersHistoryScreen()),
                  );
                  //NAVIGATION
                }),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildNavigationCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      color: const Color(0xFFE67E22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
