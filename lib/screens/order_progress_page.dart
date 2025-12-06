import 'package:flutter/material.dart';
import '../constant/theme.dart';
import '../screens/order_summary_page.dart';

class OrderProgressPage extends StatelessWidget {
  const OrderProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Progress'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/mascot.jpg'),
              ),
              const SizedBox(height: 24),
              const Text(
                'Hi!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                ),
              ),
              const Text(
                'We are still preparing\nyour order',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your order will be done in 15 minutes',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              const _ProgressTracker(),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderSummaryPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 45),
                ),
                child: const Text('See order summary'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressTracker extends StatelessWidget {
  const _ProgressTracker();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _ProgressStep(
          icon: Icons.receipt,
          label: 'Order\nreceived',
          isCompleted: true,
          isFirst: true,
        ),
        _ProgressLine(isCompleted: true),
        _ProgressStep(
          icon: Icons.restaurant,
          label: 'In the\nkitchen',
          isCompleted: true,
        ),
        _ProgressLine(isCompleted: false),
        _ProgressStep(
          icon: Icons.check_circle,
          label: 'Order is\nready',
          isCompleted: false,
          isLast: true,
        ),
      ],
    );
  }
}

class _ProgressStep extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isCompleted;
  final bool isFirst;
  final bool isLast;

  const _ProgressStep({
    required this.icon,
    required this.label,
    required this.isCompleted,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: isCompleted ? AppTheme.primary : Colors.grey,
            size: 30,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isCompleted ? AppTheme.primary : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressLine extends StatelessWidget {
  final bool isCompleted;

  const _ProgressLine({required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: isCompleted ? AppTheme.primary : Colors.grey,
      ),
    );
  }
}
