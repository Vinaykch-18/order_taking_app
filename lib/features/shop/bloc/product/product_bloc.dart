import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/shop_repository.dart';
import '../../models/cart_item.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ShopRepository repo;

  ProductBloc(this.repo) : super(ProductLoading()) {
    on<FetchProducts>(_fetchProducts);
    on<AddToCart>(_add);
    on<IncreaseQty>(_increase);
    on<DecreaseQty>(_decrease);
    on<PlaceOrder>(_placeOrder);
  }

  Future<void> _fetchProducts(
    FetchProducts event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(ProductLoading());
      final res = await repo.fetchProducts();
      if (res.statusCode == 200) {
        emit(ProductLoaded(products: res.payload, cart: const []));
      }
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  void _add(AddToCart e, Emitter<ProductState> emit) {
    try {
      if (state is! ProductLoaded) return;
      final s = state as ProductLoaded;

      final cart = List<CartItem>.from(s.cart)
        ..add(CartItem(product: e.product, quantity: 1));

      emit(s.copyWith(cart: cart));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  void _increase(IncreaseQty e, Emitter<ProductState> emit) {
    try {
      if (state is! ProductLoaded) return;
      final s = state as ProductLoaded;

      final cart = s.cart.map((c) {
        if (c.product.id == e.product.id) {
          return c.copyWith(quantity: c.quantity + 1);
        }
        return c;
      }).toList();

      emit(s.copyWith(cart: cart));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  void _decrease(DecreaseQty e, Emitter<ProductState> emit) {
    try {
      if (state is! ProductLoaded) return;
      final s = state as ProductLoaded;

      final cart = <CartItem>[];
      for (final c in s.cart) {
        if (c.product.id == e.product.id) {
          if (c.quantity > 1) {
            cart.add(c.copyWith(quantity: c.quantity - 1));
          }
        } else {
          cart.add(c);
        }
      }

      emit(s.copyWith(cart: cart));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  Future<void> _placeOrder(PlaceOrder e, Emitter<ProductState> emit) async {
    try {
      if (state is! ProductLoaded) return;
      final s = state as ProductLoaded;

      await repo.placeOrder(
        e.userId,
        s.cart
            .map((c) => {'productId': c.product.id, 'quantity': c.quantity})
            .toList(),
      );

      emit(s.copyWith(cart: [], orderPlaced: true));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
