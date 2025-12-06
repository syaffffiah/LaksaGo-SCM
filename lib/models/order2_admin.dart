class Order {
  final String dishName;
  final String orderNumber;
  final int items;
  final String imageUrl;
  final String orderDate;
  final String orderTime;
  final String status;

  const Order({
    required this.dishName,
    required this.orderNumber,
    required this.items,
    required this.imageUrl,
    required this.orderDate,
    required this.orderTime,
    required this.status,
  });
}

final List<Order> dummyOrders = [
  Order(
    dishName: 'Laksa Ayam',
    orderNumber: '#LS073',
    items: 2,
    imageUrl: 'assets/laksaAyam.jpg',
    orderDate: '20 November 2024',
    orderTime: '4:50pm',
    status: 'Completed',
  ),
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#LP042',
    items: 1,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    orderDate: '20 November 2024',
    orderTime: '3:38pm',
    status: 'Completed',
  ),
  Order(
    dishName: 'Bubur Daging',
    orderNumber: '#BP153',
    items: 2,
    imageUrl: 'assets/buburDaging.jpg',
    orderDate: '20 November 2024',
    orderTime: '3:30pm',
    status: 'Completed',
  ),
  Order(
    dishName: 'Bubur Ayam',
    orderNumber: '#BA113',
    items: 1,
    imageUrl: 'assets/buburAyam.jpg',
    orderDate: '20 November 2024',
    orderTime: '3:18pm',
    status: 'Completed',
  ),
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#LP113',
    items: 1,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    orderDate: '20 November 2024',
    orderTime: '2:30pm',
    status: 'Cancelled',
  ),
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#LP113',
    items: 1,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    orderDate: '20 December 2024',
    orderTime: '2:30pm',
    status: 'Completed',
  ),
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#LP300',
    items: 1,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    orderDate: '20 November 2024',
    orderTime: '4:00pm',
    status: 'Cancelled',
  ),
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#LP113',
    items: 1,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    orderDate: '26 December 2024',
    orderTime: '2:30pm',
    status: 'Cancelled',
  ),
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#LP402',
    items: 1,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    orderDate: '3 December 2024',
    orderTime: '2:30pm',
    status: 'Cancelled',
  ),
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#LP405',
    items: 1,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    orderDate: '25 December 2024',
    orderTime: '2:30pm',
    status: 'Cancelled',
  ),
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#LP401',
    items: 1,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    orderDate: '24 December 2024',
    orderTime: '2:30pm',
    status: 'Cancelled',
  ),
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#LP400',
    items: 1,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    orderDate: '23 December 2024',
    orderTime: '2:50pm',
    status: 'Cancelled',
  ),
  // Add more cancelled orders as needed
];
