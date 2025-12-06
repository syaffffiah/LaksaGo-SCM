import 'package:flutter/material.dart';
import 'adminloginpage.dart';
import 'staffloginpage.dart';

class StaffOptionPage extends StatelessWidget {
  const StaffOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pop(context); // navigate to previous page
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                'assets/laksago_logo.png',
                height: 80,
              ),
            ),
            SizedBox(height: 50),
            Image.asset(
              'assets/cat_mascot.png',
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'LaksaGo',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
                fontFamily: 'CustomFont',
              ),
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Admin Login',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StaffLoginPage()),
                );
              },
              child: Text(
                'Staff Login',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
