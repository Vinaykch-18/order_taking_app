class Product {
  final int id;
  final String name;
  final double price;
  final String uom;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.uom,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      uom: json['uom'],
    );
  }
}
