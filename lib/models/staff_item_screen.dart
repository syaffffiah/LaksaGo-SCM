class Staff {
  String id;
  String name;
  String email;
  String phoneNumber;
  String startDate;
  String imageUrl;

  Staff({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.startDate,
    required this.imageUrl,
  });
}

// Dummy staff data
final List<Staff> dummyStaffData = [
  Staff(
    id: "S001",
    name: "Abbie Doe",
    email: "abbie.doe@example.com",
    phoneNumber: "123456789",
    startDate: "01-Jan-2020",
    imageUrl: 'assets/abbie.png',
  ),
  Staff(
    id: "S002",
    name: "Siti Smith",
    email: "siti.smith@example.com",
    phoneNumber: "987654321",
    startDate: "15-Feb-2021",
    imageUrl: 'assets/siti.png',
  ),
];
