import 'package:flutter/material.dart';
import 'package:home_screen/login_signup/staffloginpage.dart';
import 'package:image_picker/image_picker.dart'; // Add this package for image picking
import 'dart:io'; // For handling File

import 'package:home_screen/models/staff_item_screen.dart';

class StaffProfileScreen extends StatefulWidget {
  final Staff staff;

  const StaffProfileScreen({super.key, required this.staff});

  @override
  State<StaffProfileScreen> createState() => _StaffProfileScreenState();
}

class _StaffProfileScreenState extends State<StaffProfileScreen> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 90),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFF87A03), Color(0xFFFDA34F)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(60),
                      ),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios,
                                color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.staff.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -70,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage, // Trigger image picker on tap
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage: _selectedImage == null
                              ? AssetImage(widget.staff.imageUrl)
                              : FileImage(_selectedImage!) as ImageProvider,
                          radius: 55,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 90),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(60),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 40),
                    ProfileDetail(label: "Staff ID", value: widget.staff.id),
                    ProfileDetail(label: "Email", value: widget.staff.email),
                    ProfileDetail(
                        label: "Phone Number", value: widget.staff.phoneNumber),
                    ProfileDetail(
                        label: "Start Working Date",
                        value: widget.staff.startDate),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              _showEditDialog(context, widget.staff);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6F5247),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: const Icon(Icons.edit, color: Colors.white),
                            label: const Text("Edit Profile",
                                style: TextStyle(color: Colors.white)),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {
                              _showDeleteConfirmation(
                                  context, widget.staff.name);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFFCE3126)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            icon: const Icon(Icons.delete,
                                color: Color(0xFFCE3126)),
                            label: const Text(
                              "Delete",
                              style: TextStyle(color: Color(0xFFCE3126)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _showEditDialog(BuildContext context, Staff staff) {
    final TextEditingController nameController =
        TextEditingController(text: staff.name);
    final TextEditingController emailController =
        TextEditingController(text: staff.email);
    final TextEditingController phoneController =
        TextEditingController(text: staff.phoneNumber);
    File? newProfileImage;

    Future<void> pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setState(() {
          newProfileImage = File(pickedImage.path);
        });
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: newProfileImage == null
                        ? AssetImage(staff.imageUrl)
                        : FileImage(newProfileImage!) as ImageProvider,
                    child: newProfileImage == null
                        ? const Icon(Icons.camera_alt,
                            size: 30, color: Colors.grey)
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: "Phone"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Save changes
                setState(() {
                  staff.name = nameController.text;
                  staff.email = emailController.text;
                  staff.phoneNumber = phoneController.text;
                  if (newProfileImage != null) {
                    staff.imageUrl = newProfileImage!.path; // Update image URL
                  }
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context, String staffName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Confirmation"),
          content: Text("Are you sure you want to delete $staffName?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                // Perform deletion
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StaffLoginPage()),
                );
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final String label;
  final String value;

  const ProfileDetail({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xFFF87A03),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          margin: const EdgeInsets.only(bottom: 17),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFDD6B2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
