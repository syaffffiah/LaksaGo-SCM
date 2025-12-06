import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset('assets/logo.png', height: 50),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
        ],
      ),
    );
  }
}
