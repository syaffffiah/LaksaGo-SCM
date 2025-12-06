class Feedback {
  final String userName;
  final String comment;
  final double rating;
  final DateTime date; // Added date for timestamp

  Feedback({
    required this.userName,
    required this.comment,
    required this.rating,
    required this.date,
  });
}

class FoodItem {
  final String id;
  final String name;
  final double price;
  final double rating;
  final String imageUrl;
  final String category;
  final String description; // Detailed description
  bool isFavorite;
  int quantity; // Added quantity for cart management

  final List<Feedback> feedbacks; // List of feedbacks for each item

  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.category,
    required this.description,
    this.isFavorite = false,
    this.quantity = 1, // Default quantity is 1
    required this.feedbacks,
  });

  /// Add feedback to the food item
  void addFeedback(Feedback feedback) {
    feedbacks.add(feedback);
  }

  /// Calculate the average rating from feedbacks
  double get averageRating {
    if (feedbacks.isEmpty) return rating;
    double total = feedbacks.fold(0, (sum, feedback) => sum + feedback.rating);
    return total / feedbacks.length;
  }

  /// Return popular items (rating > 4.9)
  static List<FoodItem> getPopularItems(List<FoodItem> items) {
    return items.where((item) => item.rating > 4.9).toList();
  }

  /// Toggle favorite status
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  /// Update quantity
  void updateQuantity(int newQuantity) {
    if (newQuantity > 0) {
      quantity = newQuantity;
    }
  }

  /// Create a copy of the FoodItem with updated values
  FoodItem copyWith({
    String? id,
    String? name,
    double? price,
    double? rating,
    String? imageUrl,
    String? category,
    String? description,
    bool? isFavorite,
    int? quantity,
    List<Feedback>? feedbacks,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      quantity: quantity ?? this.quantity,
      feedbacks: feedbacks ?? this.feedbacks,
    );
  }
}

//dummy data for testing
final List<FoodItem> dummyFoodItems = [
  // Laksa
  FoodItem(
    id: '1',
    name: 'Laksa Ayam',
    price: 8.00,
    rating: 5.0,
    imageUrl: 'laksaAyam.jpg',
    category: 'Laksa',
    description:
        'Made from Sarawak Laksa paste, coconut milk, and chicken stock. Served over thin rice vermicelli, it’s garnished with egg strips, and lime wedges. This hearty, spicy, and creamy dish is perfect for those craving bold and authentic flavors.',
    feedbacks: [
      Feedback(
          userName: 'Aqil_07',
          comment: 'Laksa ayam ini sedap',
          rating: 4.8,
          date: DateTime.now().subtract(Duration(days: 1))),
      Feedback(
          userName: 'Elina',
          comment: 'A bit too spicy for my taste, but still good!',
          rating: 4.8,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '2',
    name: 'Laksa Pattaya Ayam',
    price: 9.50,
    rating: 4.8,
    imageUrl: 'laksaPattayaAyam.jpg',
    category: 'Laksa',
    description:
        'Laksa Sarawak Pattaya Ayam combines tender shredded chicken with a rich, aromatic broth, served over rice vermicelli and topped with a sweet and savory Pattaya-style omelet, bean sprouts, coriander, and a wedge of lime for a unique and satisfying twist.',
    feedbacks: [
      Feedback(
          userName: 'batisharazif',
          comment: 'The food was amazing, well-seasoned',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
      Feedback(
          userName: 'Yana1234',
          comment: 'Laksa Pattaya Ayam memang sedap!',
          rating: 4.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '3',
    name: 'Laksa Udang',
    price: 8.00,
    rating: 4.8,
    imageUrl: 'laksaUdang.jpg',
    category: 'Laksa',
    description:
        'Laksa Sarawak Udang is a flavorful twist on the classic Sarawak Laksa, featuring succulent, juicy prawns (udang) as the star ingredient. The prawns’ sweet and tender taste perfectly complements the rich, aromatic broth made from Sarawak laksa paste, coconut milk, and a blend of spices.',
    feedbacks: [
      Feedback(
          userName: 'nb',
          comment:
              'Impressive quality and taste! A must-try for anyone craving this dish.',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '4',
    name: 'Laksa Pattaya Udang',
    price: 9.50,
    rating: 4.8,
    imageUrl: 'laksaPattayaUdang.PNG',
    category: 'Laksa',
    description:
        'Laksa Sarawak Pattaya Udang combines succulent prawns with a rich, aromatic broth, served over rice vermicelli and topped with a sweet and savory Pattaya-style omelet, bean sprouts, coriander, and a wedge of lime for a unique and satisfying twist.',
    feedbacks: [
      Feedback(
          userName: 'chuer.s',
          comment: 'Super yummy and satisfying!',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '5',
    name: 'Laksa Sotong',
    price: 8.50,
    rating: 4.6,
    imageUrl: 'laksaSotong.PNG',
    category: 'Laksa',
    description:
        'Laksa Sarawak Sotong is a delicious twist on the classic Sarawak Laksa, featuring tender sotong (squid) as the highlight. The squid’s delicate flavor and chewy texture pair perfectly with the rich, aromatic broth made from Sarawak laksa paste, coconut milk, and spices.',
    feedbacks: [
      Feedback(
          userName: 'MaliaBucs',
          comment: 'perfect taste, portion, and presentation.',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '6',
    name: 'Laksa Pattaya Sotong',
    price: 9.50,
    rating: 4.5,
    imageUrl: 'laksaPattayaSotong.png',
    category: 'Laksa',
    description:
        'Laksa Sarawak Pattaya Sotong combines tender squid with a rich, aromatic broth, served over rice vermicelli and topped with a sweet and savory Pattaya-style omelet, bean sprouts, coriander, and a wedge of lime for a unique and satisfying twist.',
    feedbacks: [
      Feedback(
          userName: 'syamimi_.',
          comment: 'Food was fresh, flavorful, and hit the spot',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '7',
    name: 'Laksa Ambal',
    price: 8.00,
    rating: 4.5,
    imageUrl: 'laksaAmbal.PNG',
    category: 'Laksa',
    description:
        'Laksa Sarawak Ambal is a unique variation of the classic Sarawak Laksa, featuring ambal (local bamboo clams) as the star ingredient. The clams’ sweet and delicate flavor pairs beautifully with the rich, aromatic broth made from Sarawak laksa paste, coconut milk, and spices.',
    feedbacks: [
      Feedback(
          userName: 'MiraKuku',
          comment:
              'Everything was cooked perfectly, and the presentation was excellent!',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '8',
    name: 'Laksa Pattaya Ambal',
    price: 9.50,
    rating: 4.5,
    imageUrl: 'laksaPattayaAmbal.PNG',
    category: 'Laksa',
    description:
        'Laksa Sarawak Pattaya Ambal combines tender bamboo clams (ambal) with a rich, aromatic broth, served over rice vermicelli and topped with a sweet and savory Pattaya-style omelet, bean sprouts, coriander, and a wedge of lime for a unique and satisfying seafood twist.',
    feedbacks: [
      Feedback(
          userName: 'AdmNafiz',
          comment: 'the portion was very satisfying. Highly recommend',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '9',
    name: 'Laksa Oyster',
    price: 8.00,
    rating: 4.5,
    imageUrl: 'laksaOyster.jpg',
    category: 'Laksa',
    description:
        'Laksa Sarawak Oyster combines the rich, creamy flavors of Sarawak Laksa with the fresh, briny taste of plump oysters, served over rice vermicelli and topped with bean sprouts, egg strips, and a hint of lime for a unique seafood twist.',
    feedbacks: [
      Feedback(
          userName: 'Alina',
          comment:
              'The flavors were authentic and balanced, making it a truly enjoyable meal.',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '10',
    name: 'Laksa Pattaya Oyster',
    price: 9.50,
    rating: 4.9,
    imageUrl: 'laksaPattayaOyster.PNG',
    category: 'Laksa',
    description:
        'Laksa Sarawak Pattaya Oyster combines fresh, succulent oysters with a rich, aromatic broth, served over rice vermicelli and topped with a sweet and savory Pattaya-style omelet, bean sprouts, coriander, and a wedge of lime for a unique and satisfying seafood twist.',
    feedbacks: [
      Feedback(
          userName: 'stphntb',
          comment: 'tasted fantastic! Definitely worth trying',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '11',
    name: 'Laksa Scallop',
    price: 8.00,
    rating: 4.5,
    imageUrl: 'laksaScallop.jpg',
    category: 'Laksa',
    description:
        'Laksa Sarawak Scallop is a delicious variation of the classic Sarawak Laksa, featuring tender, sweet scallops as the star ingredient. The scallops delicate flavor pairs wonderfully with the rich, aromatic broth made from Sarawak laksa paste, coconut milk, and a blend of spices.',
    feedbacks: [
      Feedback(
          userName: 'JuliaRaes',
          comment:
              'Nang nyaman laksa sitok!! Generous portions and amazing taste.',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '12',
    name: 'Laksa Pattaya Scallop',
    price: 9.50,
    rating: 4.5,
    imageUrl: 'laksaPattayaScallop.jpg',
    category: 'Laksa',
    description:
        'Laksa Sarawak Pattaya Scallop combines tender, sweet scallops with a rich, aromatic broth, served over rice vermicelli and topped with a sweet and savory Pattaya-style omelet, bean sprouts, coriander, and a wedge of lime for a unique and satisfying twist.',
    feedbacks: [
      Feedback(
          userName: 'hanisfea',
          comment: 'The food was awesome, no complaints',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '13',
    name: 'Laksa Seafood',
    price: 14.50,
    rating: 4.5,
    imageUrl: 'laksaSeafood.jpg',
    category: 'Laksa',
    description:
        'Laksa Sarawak Seafood is a delightful on the classic Sarawak Laksa, featuring a mix of fresh, succulent seafood such as prawns, squid. The rich, aromatic broth made from Sarawak laksa paste, coconut milk, and a blend of spices perfectly complements the sweet, tender flavors of the fresh seafood.',
    feedbacks: [
      Feedback(
          userName: 'LuthfiHeidi',
          comment:
              'Impressive quality and taste! A must-try for anyone craving this dish.',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '14',
    name: 'Laksa Pattaya Seafood',
    price: 16.00,
    rating: 4.5,
    imageUrl: 'laksaPattayaSeafood.PNG',
    category: 'Laksa',
    description:
        'Laksa Seafood Pattaya combines a rich, aromatic broth with a variety of fresh, succulent seafood, served over rice vermicelli and topped with a sweet and savory Pattaya-style omelet, bean sprouts, coriander, and a wedge of lime for a unique and satisfying twist.',
    feedbacks: [
      Feedback(
          userName: 'QaisaraIrdina',
          comment: 'Happy tummy, happy life',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),

  // Bubur
  FoodItem(
    id: '15',
    name: 'Bubur Ayam',
    price: 5.00,
    rating: 5.00,
    imageUrl: 'buburAyam.jpg',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam is a comforting Malaysian-style chicken porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'Itiksukamakan',
          comment: 'Nang nyaman bubur sitok!',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '16',
    name: 'Bubur Ayam Pattaya',
    price: 6.50,
    rating: 4.7,
    imageUrl: 'buburPattayaAyam.jpg',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, oyster, fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam with Oyster is a comforting Malaysian-style chicken porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'zul24',
          comment: 'SEDAPPPPP',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '17',
    name: 'Bubur Ayam + Udang',
    price: 6.50,
    rating: 4.5,
    imageUrl: 'buburUdang.jpg',
    category: 'Bubur',
    description: '',
    feedbacks: [
      Feedback(
          userName: 'Nuha',
          comment: 'Nyamannnn ',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
      Feedback(
          userName: 'farahAin',
          comment: 'A bit too spicy for my taste, but still good!',
          rating: 4.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '18',
    name: 'Bubur Ayam Pattaya + Udang',
    price: 8.00,
    rating: 4.8,
    imageUrl: 'buburPattayaUdang.png',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken,shrimp (udang), fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam with udang is a comforting Malaysian-style chicken porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'ImanNuha',
          comment: 'The portion is enough to make you full and sedapp sangat!',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
      Feedback(
          userName: 'Saiful30',
          comment: 'udang is really freshh!',
          rating: 4.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '19',
    name: 'Bubur Ayam + Sotong',
    price: 6.50,
    rating: 4.9,
    imageUrl: 'buburSotong.jpg',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, squid ring (sotong), fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam with Sotong is a comforting Malaysian-style chicken porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'chuers',
          comment:
              'The taste is amazing and I like how they decorate the dish hihi',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
      Feedback(
          userName: 'Sabrina',
          comment: 'bubur Sotong ',
          rating: 4.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '20',
    name: 'Bubur Ayam Pattaya + Sotong',
    price: 8.00,
    rating: 4.7,
    imageUrl: 'buburPattayaSotong.PNG',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, pattaya-styled omelette, sotong, fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam Pattaya with Sotong is a comforting Malaysian-style porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'Laila67',
          comment:
              'Nang nyaman bubur sitok! Will definitely repeat my order in the future <3',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
      Feedback(
          userName: 'farahAin',
          comment: 'A bit too spicy for my taste, but still good!',
          rating: 4.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '21',
    name: 'Bubur Ayam + Ambal',
    price: 6.50,
    rating: 4.5,
    imageUrl: 'buburambal.png',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, bamboo clams (ambal), fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam with Ambal is a comforting Malaysian-style chicken porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'MJ',
          comment: 'so many ambal definitely worth my money!!',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '22',
    name: 'Bubur Ayam Pattaya + Ambal',
    price: 8.00,
    rating: 4.8,
    imageUrl: 'buburPattayaAmbal.png',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, pattaya-styled omelette, bamboo clams(ambal), fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam Pattaya with Ambal is a comforting Malaysian-style porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'Shameera24',
          comment: 'Sedap makan waktu musim hujan hehe nyamannn',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '23',
    name: 'Bubur Ayam + Oyster',
    price: 6.50,
    rating: 4.9,
    imageUrl: 'buburAyamOyster.PNG',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, pattaya-styled omelette, oyster, fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam Pattaya is a comforting Malaysian-style porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'NshaNormn',
          comment: ' Will definitely repeat my order in the future <3',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '24',
    name: 'Bubur Ayam Pattaya + Oyster',
    price: 8.00,
    rating: 4.9,
    imageUrl: 'buburPattayaOyster.png',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, pattaya-styled omelette, oyster, fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam Pattaya is a comforting Malaysian-style porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'Roslinda',
          comment: 'Oyster semua fresh fresh memang nyaman!',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '25',
    name: 'Bubur Ayam + Scallop',
    price: 7.00,
    rating: 4.5,
    imageUrl: 'buburScallop.jpg',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, scallop, fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam with scallops a comforting Malaysian-style chicken porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'JohanIskandar',
          comment:
              'I was feeling unwell but this bubur ayam and scallop instantly make me feel better! ',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '26',
    name: 'Bubur Ayam Pattaya + Scallop',
    price: 8.50,
    rating: 4.8,
    imageUrl: 'buburPattayaScallop.jpg',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, pattaya-styled omelette, scallop, fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam Pattaya with Udang is a comforting Malaysian-style porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'Chuers',
          comment: 'Going to repeat again and bring my friends hehe',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '27',
    name: 'Bubur Ayam + Seafood',
    price: 13.00,
    rating: 4.9,
    imageUrl: 'buburSeafood.jpg',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken,  and combination of seafood such as bamboo clams, shrimp, squid ring, oyster, scallop fried shallots, scallions, crispy crackers, and a drizzle of soy sauce. Bubur Ayam Seafood is a comforting Malaysian-style chicken porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'Daniel',
          comment: 'As a seafood lover this is to die for I love it!',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
  FoodItem(
    id: '28',
    name: 'Bubur Ayam Seafood Pattaya',
    price: 14.50,
    rating: 4.9,
    imageUrl: 'buburPattayaSeafood.png',
    category: 'Bubur',
    description:
        'Made from soft, savory rice porridge topped with shredded chicken, pattaya-styled omelette, seafood such as squid ring, bamboo clams, scallops, shrimp, fried shallots, scallions, crispy crackers, and a drizzle of soy sauce, Bubur Ayam Pattaya with Udang is a comforting Malaysian-style porridge. It’s a warm and hearty dish perfect for breakfast or a light meal.',
    feedbacks: [
      Feedback(
          userName: 'Aylee',
          comment: 'The seafood is so fresh and TASTE AMAZING ',
          rating: 5.0,
          date: DateTime.now().subtract(Duration(days: 1))),
      Feedback(
          userName: 'Rihanna',
          comment: 'woww! the taste is superb!!',
          rating: 4.0,
          date: DateTime.now().subtract(Duration(days: 1))),
    ],
  ),
];
