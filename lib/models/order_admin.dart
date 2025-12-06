class Order {
  final String dishName;
  final String orderNumber;
  final int items;
  final String imageUrl;
  final String status;

  const Order({
    required this.dishName,
    required this.orderNumber,
    required this.items,
    required this.imageUrl,
    required this.status,
  });

  get orderDate => null;

  get orderTime => null;
}

// Sample data
final List<Order> dummyOrders = [
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#L1234',
    items: 1,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    status: 'pending',
  ),
  Order(
    dishName: 'Bubur Ayam',
    orderNumber: '#B5678',
    items: 2,
    imageUrl: 'assets/buburAyam.jpg',
    status: 'pending',
  ),
  Order(
    dishName: 'Laksa Ayam, Laksa Udang',
    orderNumber: '#L9012',
    items: 2,
    imageUrl: 'assets/laksaAyam.jpg',
    status: 'pending',
  ),
  Order(
    dishName: 'Bubur Ayam Pattaya',
    orderNumber: '#B3456',
    items: 2,
    imageUrl: 'assets/buburPattayaAyam.jpg',
    status: 'pending',
  ),
];
