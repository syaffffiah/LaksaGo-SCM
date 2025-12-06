import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/food_item.dart';
import 'cart_screen.dart';
import 'payment_screen.dart';

class FoodDetailPage extends StatelessWidget {
  final FoodItem foodItem;

  const FoodDetailPage({Key? key, required this.foodItem}) : super(key: key);

  // Convert the number of ratings to stars
  Row starsFromRating(double rating) {
    int fullStars = rating.floor();
    int halfStar = (rating - fullStars >= 0.5) ? 1 : 0;
    int emptyStars = 5 - fullStars - halfStar;

    List<Widget> starWidgets = [];

    for (int i = 0; i < fullStars; i++) {
      starWidgets.add(Icon(Icons.star, color: Colors.yellow, size: 24));
    }

    if (halfStar == 1) {
      starWidgets.add(Icon(Icons.star_half, color: Colors.yellow, size: 24));
    }

    for (int i = 0; i < emptyStars; i++) {
      starWidgets.add(Icon(Icons.star_border, color: Colors.yellow, size: 24));
    }

    return Row(children: starWidgets);
  }

  void _showAddToCartDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Color(0xFFF87A03), size: 64),
              SizedBox(height: 16),
              Text(
                'Added to cart',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF87A03)),
              ),
              SizedBox(height: 8),
              Text(
                'You have successfully added ${foodItem.name} to your cart',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF87A03),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Done'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
                child: Text(
                  'View cart',
                  style: TextStyle(color: const Color(0xFFF87A03)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: 40,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/${foodItem.imageUrl}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodItem.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        starsFromRating(foodItem.rating),
                        SizedBox(height: 8),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(foodItem.description),
                        SizedBox(height: 16),
                        Text(
                          'Customer Feedback',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: foodItem.feedbacks.length,
                          itemBuilder: (context, index) {
                            final feedback = foodItem.feedbacks[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Card(
                                color: Colors.white,
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.orange,
                                        child: Text(
                                          feedback.userName[0].toUpperCase(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    feedback.userName,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                starsFromRating(
                                                    feedback.rating),
                                                Text(
                                                  '${(feedback.date.difference(DateTime.now()).inDays).abs()} days ago',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 4),
                                            Text(feedback.comment),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'RM${foodItem.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(foodItem);
                      _showAddToCartDialog(context);
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                          orderId:
                              '#LS${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
                          totalAmount: foodItem.price,
                          cartItems: [foodItem],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF5D3F2E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('ORDER NOW'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
