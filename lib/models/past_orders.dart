class PastOrders {
  final String orderId;
  final String paymentId;
  final String paymentMethod;
  final String itemName;
  final double itemPrice;
  final double totalPrice;
  final String imageURL;

  PastOrders({
    required this.orderId,
    required this.paymentId,
    required this.paymentMethod,
    required this.itemName,
    required this.itemPrice,
    required this.totalPrice,
    required this.imageURL,
  });
}
