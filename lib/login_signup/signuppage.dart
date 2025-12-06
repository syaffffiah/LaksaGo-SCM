import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_screen/login_signup/auth_service.dart';
import 'signupsuccesspage.dart';
import 'loginpage.dart'; // Import the login page

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final _auth = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pop(context); // Navigate to the previous page
          },
        ),
      ),
      body: Center(
        // This centers all the content vertically and horizontally
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Vertically center the content
            crossAxisAlignment:
                CrossAxisAlignment.center, // Horizontally center the content
            children: [
              // Title
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              SizedBox(
                  height: 30), // Reduced height between title and first field

              // Email Input Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20), // Reduced height between input fields

              // Password Input Field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true, // Hide password
              ),
              SizedBox(height: 20), // Reduced height between input fields

              // Already have an account? Log in
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                      children: [
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFFA726),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30), // Adjusted height before the Sign Up button

              // Sign Up Button
              ElevatedButton(
                onPressed: () => _signup(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signup(BuildContext context) async {
  final user = await _auth.createUserWithEmailAndPassword(
      _emailController.text, _passwordController.text);
  if (user != null) {
    log("User created successfully");
    // Call the gotoSignUpSuccessPage function here, assuming it's defined outside
    gotoSignUpSuccessPage(context); 
  }
}

// Define the gotoSignUpSuccessPage function outside of _signup
void gotoSignUpSuccessPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUpSuccessPage()),
  );
}

}