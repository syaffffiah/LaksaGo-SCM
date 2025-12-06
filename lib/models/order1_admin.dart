class Order {
  final String dishName;
  final String orderNumber;
  final int items;
  final String imageUrl;
  final String orderDate;
  final String orderTime;

  const Order({
    required this.dishName,
    required this.orderNumber,
    required this.items,
    required this.imageUrl,
    required this.orderDate,
    required this.orderTime,
  });
}

// Sample data matching the screenshot
final List<Order> dummyOrders = [
  Order(
    dishName: 'Laksa Ayam',
    orderNumber: '#LS073',
    items: 2,
    imageUrl: 'assets/laksaAyam.jpg',
    orderDate: '20 November 2024',
    orderTime: '4:50pm',
  ),
  Order(
    dishName: 'Laksa Pattaya Ayam',
    orderNumber: '#LP042',
    items: 1,
    imageUrl: 'assets/buburPattayaAyam.jpg',
    orderDate: '20 November 2024',
    orderTime: '3:38pm',
  ),
  Order(
    dishName: 'Bubur Daging',
    orderNumber: '#BP153',
    items: 2,
    imageUrl: 'assets/buburDaging.jpg',
    orderDate: '20 November 2024',
    orderTime: '3:30pm',
  ),
  Order(
    dishName: 'Bubur Ayam',
    orderNumber: '#BA113',
    items: 1,
    imageUrl: 'assets/buburAyam.jpg',
    orderDate: '20 November 2024',
    orderTime: '3:18pm',
  ),
];
