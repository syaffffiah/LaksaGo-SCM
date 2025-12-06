import 'package:flutter/material.dart';

class MonthlyReportScreen extends StatelessWidget {
  final String month;

  const MonthlyReportScreen({
    super.key,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.brown),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          month,
          style: const TextStyle(
            color: Color(0xFF6F5247),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Filter Row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButton<String>(
                    value: "Date",
                    underline: const SizedBox(),
                    items: ["Date", "Item", "Payment"]
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: const TextStyle(fontSize: 13)),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButton<String>(
                    value: "Descending",
                    underline: const SizedBox(),
                    items: ["Ascending", "Descending"]
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: const TextStyle(fontSize: 13)),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            // Table
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 600, // Maximum width for larger screens
                    ),
                    child: Table(
                      defaultColumnWidth: const IntrinsicColumnWidth(),
                      border: TableBorder.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                      columnWidths: const {
                        0: FixedColumnWidth(31), // Bil
                        1: FixedColumnWidth(65), // Order ID
                        2: FixedColumnWidth(65), // Date
                        3: FixedColumnWidth(70), // Item
                        4: FixedColumnWidth(50), // Quantity
                        5: FixedColumnWidth(90), // Payment
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                          ),
                          children: [
                            'Bil.',
                            'Order ID',
                            'Date',
                            'Item',
                            'Qty',
                            'Payment Type'
                          ]
                              .map((header) => TableCell(
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      child: Text(
                                        header,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        _buildTableRow(
                          '1',
                          '#LS108',
                          '31/10/24',
                          'Laksa Ayam',
                          '2',
                          'Cash',
                        ),
                        _buildTableRow(
                          '2',
                          '#BA119',
                          '31/10/24',
                          'Bubur Ayam',
                          '1',
                          'Cash',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            // Print Button
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle print
                },
                icon: const Icon(Icons.print, color: Colors.white, size: 20),
                label: const Text(
                  'Print',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF87A03),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(
    String bil,
    String orderId,
    String date,
    String item,
    String quantity,
    String paymentType,
  ) {
    return TableRow(
      children: [bil, orderId, date, item, quantity, paymentType]
          .map((cell) => TableCell(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    cell,
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
