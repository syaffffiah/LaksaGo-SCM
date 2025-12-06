import 'package:flutter/material.dart';
import '../models/past_orders.dart';
import 'payment_details_screen.dart';

class OrderSummaryScreen extends StatelessWidget {
  final PastOrders order;

  const OrderSummaryScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Summary',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Order ID', order.orderId),
            _buildDetailRow('Payment ID', order.paymentId),
            Text(
              order.paymentMethod,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            _buildItemRow(order.itemName, order.itemPrice),
            const Divider(thickness: 1),
            _buildDetailRow(
                'Total:', 'RM${order.totalPrice.toStringAsFixed(2)}',
                isBold: true),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to PaymentDetailsScreen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentDetailsScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF87A03),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: isBold ? FontWeight.bold : null),
          ),
          Text(
            value,
            style: TextStyle(fontWeight: isBold ? FontWeight.bold : null),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(String itemName, double itemPrice) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'RM${itemPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
