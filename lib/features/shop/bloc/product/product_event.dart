import 'package:equatable/equatable.dart';
import '../../models/product_model.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductEvent {}

class AddToCart extends ProductEvent {
  final Product product;
  AddToCart(this.product);
}

class IncreaseQty extends ProductEvent {
  final Product product;
  IncreaseQty(this.product);
}

class DecreaseQty extends ProductEvent {
  final Product product;
  DecreaseQty(this.product);
}

class PlaceOrder extends ProductEvent {
  final int userId;
  PlaceOrder(this.userId);
}
