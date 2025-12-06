import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String name = 'Sophia Patel';
  String email = 'sophiapatel@gmail.com';
  String phoneNumber = '012-3456789';
  String password = 'password'; // Use a masked input for security

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = name;
    emailController.text = email;
    phoneController.text = phoneNumber;
    passwordController.text = password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.orange,
                      child:
                          Icon(Icons.camera_alt, size: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildTextField('Name', nameController),
            SizedBox(height: 16), // Space between fields
            _buildTextField('Email', emailController),
            SizedBox(height: 16),
            _buildTextField('Phone Number', phoneController),
            SizedBox(height: 16),
            _buildTextField('Password', passwordController, isObscured: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                  email = emailController.text;
                  phoneNumber = phoneController.text;
                  password = passwordController.text;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile updated successfully!')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text('Done', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isObscured = false}) {
    return TextField(
      controller: controller,
      obscureText: isObscured,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
