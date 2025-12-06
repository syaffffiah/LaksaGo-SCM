import 'package:flutter/material.dart';
import '../models/past_orders.dart';
import 'order_summary_screen.dart';
import 'profile_screen.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // dummy past orders
    final pastOrders = [
      PastOrders(
        orderId: '#LS741',
        paymentId: '#QR541',
        itemName: 'Laksa Sotong',
        paymentMethod: 'Paid using QR Scan',
        itemPrice: 6.50,
        totalPrice: 6.50,
        imageURL: 'assets/laksaSotong.PNG',
      ),
      PastOrders(
        orderId: '#LS541',
        paymentId: '#C446',
        itemName: 'Bubur Ayam',
        paymentMethod: 'Paid using Cash',
        itemPrice: 4.50,
        totalPrice: 4.50,
        imageURL: 'assets/buburAyam.jpg',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: const Color(0xFFF87A03),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ),
                            );
                          },
                        ),
                        const Expanded(
                          child: Text(
                            'My Payments',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage('assets/profile.png'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: pastOrders.length,
              itemBuilder: (context, index) {
                final order = pastOrders[index];
                return _buildPaymentCard(context, order);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(BuildContext context, PastOrders order) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                order.imageURL,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment ID: ${order.paymentId}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Order ID : ${order.orderId}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'RM${order.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Order Summary screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OrderSummaryScreen(order: order),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF87A03),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                    ),
                    child: const Text(
                      'View Order Summary',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
