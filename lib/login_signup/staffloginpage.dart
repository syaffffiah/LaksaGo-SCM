import 'package:flutter/material.dart';
import '../staff_screen/dashboard_screen.dart';
import '../models/staff_item_screen.dart';

class StaffLoginPage extends StatefulWidget {
  const StaffLoginPage({super.key});

  @override
  State<StaffLoginPage> createState() => _StaffLoginPageState();
}

class _StaffLoginPageState extends State<StaffLoginPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _staffIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage; // Error message state variable

  @override
  void dispose() {
    _staffIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Dummy credentials for staff login
  final Map<String, String> dummyCredentials = {
    "S001": "staff123",
  };

  void _login() {
    final staffId = _staffIdController.text.trim();
    final password = _passwordController.text.trim();

    // Check if the entered credentials match
    if (dummyCredentials.containsKey(staffId) &&
        dummyCredentials[staffId] == password) {
      final matchedStaff =
          dummyStaffData.firstWhere((staff) => staff.id == staffId);

      // Navigate to the DashboardScreen with the matched staff
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(staff: matchedStaff),
        ),
      );
    } else {
      // Update the state with the error message
      setState(() {
        _errorMessage = "Invalid Staff ID or Password.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pop(context); // Navigate to the previous page
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Staff Log In',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _staffIdController,
              decoration: InputDecoration(
                labelText: 'Staff ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              obscureText: !_isPasswordVisible,
            ),
            if (_errorMessage != null) // Display the error message if it exists
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Log In',
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
