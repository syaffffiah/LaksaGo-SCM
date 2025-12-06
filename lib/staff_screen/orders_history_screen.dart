import 'package:flutter/material.dart';
import '../models/order2_admin.dart';

class OrdersHistoryScreen extends StatefulWidget {
  const OrdersHistoryScreen({super.key});

  @override
  State<OrdersHistoryScreen> createState() => _OrdersHistoryScreenState();
}

class _OrdersHistoryScreenState extends State<OrdersHistoryScreen> {
  String selectedMonth = 'November';
  String selectedYear = '2024';
  String selectedStatus = 'Completed';
  bool isStatusDropdownOpen = true;

  Order? selectedOrder;

  List<Order> getFilteredOrders() {
    return dummyOrders.where((order) {
      final monthMatches = order.orderDate.contains(selectedMonth);
      final yearMatches = order.orderDate.contains(selectedYear);
      final statusMatches = order.status == selectedStatus;
      return monthMatches && yearMatches && statusMatches;
    }).toList();
  }

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
          'Orders History',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter Section
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterDropdown(
                  'Month',
                  ['November', 'December'],
                  selectedMonth,
                  (value) {
                    setState(() {
                      selectedMonth = value!;
                    });
                  },
                ),
                _buildFilterDropdown(
                  'Year',
                  ['2023', '2024'],
                  selectedYear,
                  (value) {
                    setState(() {
                      selectedYear = value!;
                    });
                  },
                ),
                _buildFilterDropdown(
                  'Status',
                  ['Completed', 'Cancelled'],
                  selectedStatus,
                  (value) {
                    setState(() {
                      selectedStatus = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          // Orders List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: getFilteredOrders().length,
              separatorBuilder: (context, index) => const Divider(
                height: 32,
                thickness: 0.8,
                color: Color(0xFFE67E22),
              ),
              itemBuilder: (context, index) {
                final order = getFilteredOrders()[index];
                return _buildOrderCard(order);
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[50],
    );
  }

  Widget _buildFilterDropdown(
    String label,
    List<String> items,
    String currentValue,
    void Function(String?) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: currentValue,
        underline: const SizedBox(), // Remove underline
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                order.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            // Order Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.dishName,
                    style: const TextStyle(
                      fontSize: 18,
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B4513),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Order Summary',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order ID: ${order.orderNumber}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      order.dishName,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'RM0.00',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.green),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Takeaway Fee: RM0.00',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.red),
                                    ),
                                    const Divider(height: 20, thickness: 1),
                                    Text(
                                      'Total: RM0.00',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('View Order'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          _showStyledConfirmationDialog(order);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Delete Order'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showStyledConfirmationDialog(Order order) async {
    final bool? confirmAction = await showDialog<bool>(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36), // Rounded dialog
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Close Icon (Top Right)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () => Navigator.pop(context), // Close dialog
                  ),
                ),
                const SizedBox(height: 18),
                // Dialog Text
                const Text(
                  'Are you sure you want to reject this order?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                // Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Yes Button
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          selectedOrder = order; // Assign the selected order
                          dummyOrders
                              .remove(selectedOrder); // Remove it from the list
                        });
                        Navigator.pop(context, true); // Close the dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                      ),
                      icon: const Icon(
                        Icons.check_circle,
                        size: 18,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // No Button
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context, false); // Cancel action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                      ),
                      icon: const Icon(
                        Icons.cancel,
                        size: 18,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'No',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    if (confirmAction == true) {
      // Perform deletion or rejection logic if confirmed
      setState(() {
        dummyOrders.remove(order);
      });
    }
  }
}
