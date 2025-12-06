import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart'; // Needed for image picking
import 'staff_profile_screen.dart';
import '../models/staff_data_admin.dart';

class StaffListScreen extends StatefulWidget {
  const StaffListScreen({super.key});

  @override
  State<StaffListScreen> createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  final List<Staff> staffList = [
    Staff(
      name: "Siti Nurmysarah",
      imageUrl: "assets/siti.png",
      id: "#SID05",
      email: "snmysarah@gmail.com",
      phoneNumber: "010-2345678",
      startDate: "3 April 2024",
    ),
    Staff(
      name: "Abbie Suzanna",
      imageUrl: "assets/abbie.png",
      id: "#SID06",
      email: "abbie.suzanna@gmail.com",
      phoneNumber: "010-9876543",
      startDate: "10 May 2024",
    ),
  ];

  void _addNewStaff(Staff staff) {
    setState(() {
      staffList.add(staff);
    });
  }

  void _showAddStaffDialog() {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController startDateController = TextEditingController();
    File? selectedImage;

    Future<void> pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          selectedImage = File(pickedFile.path);
        });
      }
    }

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Add New Staff"),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: selectedImage != null
                          ? FileImage(selectedImage!)
                          : const AssetImage('assets/defaultprofile.webp')
                              as ImageProvider,
                      child: selectedImage == null
                          ? const Icon(Icons.camera_alt, size: 30)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(labelText: "Phone"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a phone number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: startDateController,
                    decoration: const InputDecoration(labelText: "Start Date"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a start date";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newStaff = Staff(
                    name: nameController.text,
                    email: emailController.text,
                    phoneNumber: phoneController.text,
                    startDate: startDateController.text,
                    id: '#SID${DateTime.now().millisecondsSinceEpoch}',
                    imageUrl: selectedImage?.path ??
                        'assets/defaultprofile.webp', // Default image
                  );
                  _addNewStaff(newStaff);
                  Navigator.of(ctx).pop();
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Staff",
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.brown),
            onPressed: _showAddStaffDialog,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: staffList.length,
        itemBuilder: (context, index) {
          final staff = staffList[index];
          return Card(
            color: const Color(0xFFF87A03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 160,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: staff.imageUrl.contains("assets/")
                        ? Image.asset(
                            staff.imageUrl,
                            width: 120,
                            height: 150,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(staff.imageUrl),
                            width: 120,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          staff.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StaffProfileScreen(staff: staff),
                          ),
                        ).then((_) {
                          setState(() {});
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(50, 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      child: const Text(
                        "View Profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
