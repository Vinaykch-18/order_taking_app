class OrderDetail {
  final int orderId;
  final double totalAmount;
  final List<OrderItemDetail> items;

  OrderDetail({
    required this.orderId,
    required this.totalAmount,
    required this.items,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      orderId: json['orderId'],
      totalAmount: json['totalAmount'].toDouble(),
      items: (json['items'] as List)
          .map((e) => OrderItemDetail.fromJson(e))
          .toList(),
    );
  }
}

class OrderItemDetail {
  final int productId;
  final int quantity;
  final double price;

  OrderItemDetail({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  factory OrderItemDetail.fromJson(Map<String, dynamic> json) {
    return OrderItemDetail(
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
    );
  }
}
