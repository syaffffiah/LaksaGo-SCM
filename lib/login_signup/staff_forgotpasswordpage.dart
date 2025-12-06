import 'package:flutter/material.dart';
import 'staffpasswordresetsuccess.dart';

class StaffForgotPasswordPage extends StatefulWidget {
  const StaffForgotPasswordPage({super.key});

  @override
  _StaffForgotPasswordPageState createState() =>
      _StaffForgotPasswordPageState();
}

class _StaffForgotPasswordPageState extends State<StaffForgotPasswordPage> {
  final TextEditingController adminIdController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Validation to check if new password and confirm password match
  bool _isPasswordsMatch() {
    return newPasswordController.text == confirmPasswordController.text;
  }

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
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: adminIdController,
              decoration: InputDecoration(
                labelText: 'Admin ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Check if new password and confirm password match
                if (_isPasswordsMatch()) {
                  // Navigate to Password Reset Success page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StaffPasswordResetSuccessfulPage()),
                  );
                } else {
                  // Show error message if passwords don't match
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Passwords do not match')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
