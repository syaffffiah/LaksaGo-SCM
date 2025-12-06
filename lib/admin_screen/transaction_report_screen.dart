import 'package:flutter/material.dart';
import 'monthly_report_screen.dart';

class TransactionReportScreen extends StatelessWidget {
  final List<String> months = [
    "November",
    "October",
    "September",
    "August",
    "July",
    "June",
    "May",
    "April",
    "March",
  ];

  TransactionReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF87A03),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Transaction Report",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Year Dropdown
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 100,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButton<String>(
                  value: "2024",
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: ["2024", "2023", "2022"]
                      .map((year) => DropdownMenuItem(
                            value: year,
                            child: Text(year),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          // Months List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: months.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    months[index],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6F5247),
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MonthlyReportScreen(
                                month: months[index],
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.print,
                            color: Colors.white, size: 12),
                        label: const Text(
                          'Print',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF87A03),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Color(0xFFCE3126),
                        ),
                        onPressed: () {
                          // Handle delete
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
