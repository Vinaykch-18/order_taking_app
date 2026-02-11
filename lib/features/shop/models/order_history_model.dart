class OrderHistory {
  final int orderId;
  final String orderDate;
  final double totalAmount;

  OrderHistory({
    required this.orderId,
    required this.orderDate,
    required this.totalAmount,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) {
    return OrderHistory(
      orderId: json['orderId'],
      orderDate: json['orderDate'],
      totalAmount: json['totalAmount'].toDouble(),
    );
  }
}
