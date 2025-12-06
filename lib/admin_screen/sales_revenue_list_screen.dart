import 'package:flutter/material.dart';
import 'monthly_revenue_details_screen.dart';

class SalesRevenueListScreen extends StatelessWidget {
  const SalesRevenueListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF87A03),
        title:
            const Text('Sales Revenue', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 12, // Example: One for each month
        itemBuilder: (context, index) {
          final months = [
            'January',
            'February',
            'March',
            'April',
            'May',
            'June',
            'July',
            'August',
            'September',
            'October',
            'November',
            'December'
          ];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                months[index],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MonthlyRevenueDetailsScreen(
                            month: months[index],
                            chartData: [],
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF87A03),
                    ),
                    child: const Text('Print',
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Add delete logic here
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
