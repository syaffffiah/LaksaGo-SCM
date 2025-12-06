import 'package:flutter/material.dart';
import 'welcomepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/laksago_logo.png', height: 150),
              SizedBox(height: 20),
              Text(
                'LaksaGo',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'CustomFont',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
