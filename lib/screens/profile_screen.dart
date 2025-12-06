import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'my_orders_page.dart';
import '../login_signup/welcomepage.dart';
import 'edit_profile_screen.dart';
import 'payment_details_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
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
            // Profile Information Boxes
            _buildInfoBox('Name', 'Sophia Patel'),
            _buildInfoBox('Email', 'sophiapatel@gmail.com'),
            _buildInfoBox('Phone Number', '012-3456789'),
            _buildInfoBox('Password', '••••••••'), // Masked password
            SizedBox(height: 20),
            // Additional Links with Icons
            _buildLinkButton(context, 'Payment Details'),
            _buildLinkButton(context, 'Order History'),
            SizedBox(height: 20),
            // Buttons moved below
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Edit Profile action
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const EditProfilePage()), // Navigate to EditProfilePage
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.brown, // White text
                  ),
                  child: Text('Edit Profile'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Log out action
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.white, // Orange text
                    side: BorderSide(color: Colors.orange), // Orange outline
                  ),
                  child: Text('Log out'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, String value) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4.0),
          Text(
            value,
            style: TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildLinkButton(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        if (title == 'Order History') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyOrdersPage()),
          );
        } else if (title == 'Payment Details') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PaymentDetailsScreen()),
          );
        }
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.brown),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
