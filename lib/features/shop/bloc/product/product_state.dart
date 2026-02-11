import 'package:equatable/equatable.dart';
import '../../models/cart_item.dart';
import '../../models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final List<CartItem> cart;
  final bool orderPlaced;

  const ProductLoaded({
    required this.products,
    required this.cart,
    this.orderPlaced = false,
  });

  ProductLoaded copyWith({
    List<Product>? products,
    List<CartItem>? cart,
    bool? orderPlaced,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      cart: cart ?? this.cart,
      orderPlaced: orderPlaced ?? false,
    );
  }

  @override
  List<Object?> get props => [products, cart, orderPlaced];
}

class ProductFailure extends ProductState {
  final String message;

  const ProductFailure(this.message);

  @override
  List<Object?> get props => [message];
}
