// MenuItem Class
class MenuItem {
  final String id;
  final String name;
  String description;
  double price;
  final String imageUrl;
  final String category;
  bool isAvailable;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.isAvailable = true,
  });
}

// Sample Data
final List<MenuItem> menuItems = [
  // Laksa Sarawak
  MenuItem(
    id: '1',
    name: 'Laksa Ayam',
    description:
        'Made from Sarawak Laksa paste, coconut milk, and chicken stock. Served over thin rice noodles and garnished with egg strips and lime leaf.',
    price: 6.00,
    imageUrl: 'assets/laksaAyam.jpg',
    category: 'Laksa Sarawak',
  ),
  MenuItem(
    id: '2',
    name: 'Laksa Oyster',
    description:
        'Laksa Sarawak with fresh oysters, cooked in aromatic coconut milk broth.',
    price: 7.00,
    imageUrl: 'assets/laksaOyster.jpg',
    category: 'Laksa Sarawak',
  ),
  MenuItem(
    id: '3',
    name: 'Laksa Ambal',
    description: 'Classic Sarawak Laksa infused with Ambal, a local delicacy.',
    price: 6.50,
    imageUrl: 'assets/laksaAmbal.PNG',
    category: 'Laksa Sarawak',
  ),
  MenuItem(
    id: '4',
    name: 'Laksa Sotong',
    description: 'Sarawak Laksa with tender squid slices.',
    price: 7.50,
    imageUrl: 'assets/laksaSotong.PNG',
    category: 'Laksa Sarawak',
  ),
  MenuItem(
    id: '5',
    name: 'Laksa Udang',
    description: 'Sarawak Laksa with fresh prawns.',
    price: 8.00,
    imageUrl: 'assets/laksaUdang.jpg',
    category: 'Laksa Sarawak',
  ),
  MenuItem(
    id: '6',
    name: 'Laksa Scallop',
    description: 'Sarawak Laksa topped with succulent scallops.',
    price: 9.00,
    imageUrl: 'assets/laksaScallop.jpg',
    category: 'Laksa Sarawak',
  ),
  MenuItem(
    id: '7',
    name: 'Laksa Seafood',
    description:
        'Delicious laksa sarawak topped with scallops, ambals, shrimps and many more seafoods.',
    price: 6.50,
    imageUrl: 'assets/laksaSeafood.jpg',
    category: 'Laksa',
  ),

  // Laksa Pattaya
  MenuItem(
    id: '8',
    name: 'Laksa Pattaya Ayam',
    description: 'A Pattaya-style Laksa with chicken and rich spices.',
    price: 7.50,
    imageUrl: 'assets/laksaPattayaAyam.jpg',
    category: 'Laksa Pattaya',
  ),
  MenuItem(
    id: '9',
    name: 'Laksa Pattaya Oyster',
    description: 'Pattaya Laksa served with fresh oysters.',
    price: 8.00,
    imageUrl: 'assets/laksaPattayaOyster.PNG',
    category: 'Laksa Pattaya',
  ),
  MenuItem(
    id: '10',
    name: 'Laksa Pattaya Ambal',
    description: 'Pattaya Laksa with Ambal delicacy.',
    price: 7.00,
    imageUrl: 'assets/laksaPattayaAmbal.PNG',
    category: 'Laksa Pattaya',
  ),
  MenuItem(
    id: '11',
    name: 'Laksa Pattaya Sotong',
    description: 'Pattaya Laksa with tender squid.',
    price: 8.50,
    imageUrl: 'assets/laksaPattayaSotong.png',
    category: 'Laksa Pattaya',
  ),
  MenuItem(
    id: '12',
    name: 'Laksa Pattaya Udang',
    description: 'Pattaya Laksa with fresh prawns.',
    price: 9.00,
    imageUrl: 'assets/laksaPattayaUdang.PNG',
    category: 'Laksa Pattaya',
  ),
  MenuItem(
    id: '13',
    name: 'Laksa Pattaya Scallop',
    description: 'Pattaya Laksa with succulent scallops.',
    price: 10.00,
    imageUrl: 'assets/laksaPattayaScallop.jpg',
    category: 'Laksa Pattaya',
  ),
  MenuItem(
    id: '14',
    name: 'Laksa Pattaya Seafood',
    description:
        'Delicious laksa sarawak topped with scallops, ambals, shrimps and many more seafoods, has pattaya-styled omellete.',
    price: 6.50,
    imageUrl: 'assets/laksaPattayaSeafood.PNG',
    category: 'Laksa Pattaya',
  ),

  // Bubur
  MenuItem(
    id: '15',
    name: 'Bubur Ayam',
    description: 'Warm chicken porridge, perfect comfort food.',
    price: 4.50,
    imageUrl: 'assets/buburAyam.jpg',
    category: 'Bubur',
  ),
  MenuItem(
    id: '16',
    name: 'Bubur Daging',
    description: 'Savory porridge with tender beef slices.',
    price: 5.00,
    imageUrl: 'assets/buburDaging.jpg',
    category: 'Bubur',
  ),
  MenuItem(
    id: '17',
    name: 'Bubur Ambal',
    description: 'Porridge infused with Ambal, rich in flavor.',
    price: 4.50,
    imageUrl: 'assets/buburambal.png',
    category: 'Bubur',
  ),
  MenuItem(
    id: '18',
    name: 'Bubur Sotong',
    description: 'Warm porridge with tender squid slices.',
    price: 5.50,
    imageUrl: 'assets/buburSotong.jpg',
    category: 'Bubur',
  ),
  MenuItem(
    id: '20',
    name: 'Bubur Udang',
    description: 'Savory porridge with fresh prawns.',
    price: 6.00,
    imageUrl: 'assets/buburUdang.jpg',
    category: 'Bubur',
  ),
  MenuItem(
    id: '21',
    name: 'Bubur Scallop',
    description: 'Delicious porridge topped with scallops.',
    price: 6.50,
    imageUrl: 'assets/buburScallop.jpg',
    category: 'Bubur',
  ),
  MenuItem(
    id: '22',
    name: 'Bubur Seafood',
    description:
        'Delicious porridge topped with scallops, ambals, shrimps and many more seafoods.',
    price: 6.50,
    imageUrl: 'assets/buburSeafood.jpg',
    category: 'Bubur',
  ),

  //Bubur Pattaya
  MenuItem(
    id: '23',
    name: 'Bubur Pattaya Ayam',
    description:
        'Warm chicken porridge, perfect comfort food, has pattaya-styled omelette.',
    price: 4.50,
    imageUrl: 'assets/buburPattayaAyam.jpg',
    category: 'Bubur Pattaya',
  ),
  MenuItem(
    id: '24',
    name: 'Bubur Pattaya Daging',
    description:
        'Savory porridge with tender beef slices, has pattaya-styled omellete.',
    price: 5.00,
    imageUrl: 'assets/buburPattayaDaging.png',
    category: 'Bubur Pattaya',
  ),
  MenuItem(
    id: '25',
    name: 'Bubur Pattaya Ambal',
    description:
        'Porridge infused with Ambal, rich in flavor has pattaya-styled omellete.',
    price: 4.50,
    imageUrl: 'assets/buburPattayaAmbal.png',
    category: 'Bubur Pattaya',
  ),
  MenuItem(
    id: '26',
    name: 'Bubur Pattaya Sotong',
    description:
        'Warm porridge with tender squid slices, has pattaya-styled omellete.',
    price: 5.50,
    imageUrl: 'assets/buburPattayaSotong.PNG',
    category: 'Bubur Pattaya',
  ),
  MenuItem(
    id: '27',
    name: 'Bubur Pattaya Oyster',
    description:
        'Warm porridge with tender oyster, has pattaya-styled omellete.',
    price: 5.50,
    imageUrl: 'assets/buburPattayaOyster.png',
    category: 'Bubur Pattaya',
  ),
  MenuItem(
    id: '28',
    name: 'Bubur Pattaya Udang',
    description:
        'Savory porridge with fresh prawns, has pattaya-styled omellete.',
    price: 6.00,
    imageUrl: 'assets/buburPattayaUdang.png',
    category: 'Bubur Pattaya',
  ),
  MenuItem(
    id: '29',
    name: 'Bubur Pattaya Scallop',
    description:
        'Delicious porridge topped with scallops, has pattaya-styled omellete.',
    price: 6.50,
    imageUrl: 'assets/buburPattayaScallop.png',
    category: 'Bubur Pattaya',
  ),
  MenuItem(
    id: '30',
    name: 'Bubur Pattaya Seafood',
    description:
        'Delicious porridge topped with scallops, ambals, shrimps and many more seafoods, has pattaya-styled omellete.',
    price: 6.50,
    imageUrl: 'assets/buburPattayaSeafood.png',
    category: 'Bubur Pattaya',
  ),
];
