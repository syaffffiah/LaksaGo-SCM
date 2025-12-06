import 'package:flutter/material.dart';
import '../models/order2_admin.dart';

class OrderHistoryMonthScreen extends StatelessWidget {
  final String title;
  final List<Order> orders;

  const OrderHistoryMonthScreen({
    super.key,
    required this.title,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
          color: Colors.orange,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.orange,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text(
                'No orders found for this month.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: orders.length,
              separatorBuilder: (context, index) => const Divider(
                height: 32,
                thickness: 0.8,
                color: Color(0xFFE67E22),
              ),
              itemBuilder: (context, index) {
                final order = orders[index];
                return _buildOrderCard(order);
              },
            ),
      backgroundColor: Colors.grey[50],
    );
  }

  Widget _buildOrderCard(Order order) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            order.imageUrl,
            width: 140,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.dishName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${order.orderDate}, ${order.orderTime}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              Text(
                'Order ID: ${order.orderNumber}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${order.items} items',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
