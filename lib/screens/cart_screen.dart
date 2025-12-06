import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import '../providers/cart_provider.dart';
import 'place_order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> selectedItemsIndices = [];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: Text(
          'Cart',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.brown),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: cart.cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: cart.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cart.cartItems[index];
                      final isSelected = selectedItemsIndices.contains(index);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedItemsIndices.remove(index);
                            } else {
                              selectedItemsIndices.add(index);
                            }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color:
                                isSelected ? Color(0xFFE67E22) : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/${item.imageUrl}',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'RM${item.price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.brown,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          _buildCircleButton(
                                            Icons.remove,
                                            () => cart.decreaseQuantity(item),
                                            isSelected,
                                          ),
                                          SizedBox(width: 16),
                                          Text(
                                            '${item.quantity}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          _buildCircleButton(
                                            Icons.add,
                                            () => cart.increaseQuantity(item),
                                            isSelected,
                                          ),
                                          Spacer(),
                                          _buildCircleButton(
                                            Icons.delete_outline,
                                            () => cart.removeFromCart(item),
                                            isSelected,
                                            isDelete: true,
                                          ),
                                        ],
                                      ),
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
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: selectedItemsIndices.isEmpty
                        ? null
                        : () {
                            final selectedItems = selectedItemsIndices
                                .map((index) => cart.cartItems[index])
                                .toList();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlaceOrderScreen(
                                    selectedItems: selectedItems),
                              ),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE67E22),
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Place Order',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildCircleButton(
    IconData icon,
    VoidCallback onPressed,
    bool isSelected, {
    bool isDelete = false,
  }) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? Colors.white
            : isDelete
                ? Colors.grey[200]
                : Color(0xFFE67E22),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 16,
        ),
        color: isSelected
            ? Color(0xFFE67E22)
            : isDelete
                ? Colors.grey[400]
                : Colors.white,
        padding: EdgeInsets.zero,
        onPressed: onPressed,
      ),
    );
  }
}
