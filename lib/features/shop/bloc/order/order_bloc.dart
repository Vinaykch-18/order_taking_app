import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/shop_repository.dart';
import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final ShopRepository repo;

  OrderBloc(this.repo) : super(OrderLoading()) {
    on<FetchOrders>(_fetchOrders);
    on<FetchOrderDetails>(_fetchOrderDetails);
  }

  Future<void> _fetchOrders(FetchOrders event, Emitter<OrderState> emit) async {
    try {
      emit(OrderLoading());
      final res = await repo.fetchOrders(event.userId);
      if (res.statusCode == 200) {
        emit(OrdersLoaded(res.payload));
      }
    } catch (e) {
      emit(OrderFailure(e.toString()));
    }
  }

  Future<void> _fetchOrderDetails(
    FetchOrderDetails event,
    Emitter<OrderState> emit,
  ) async {
    try {
      emit(OrderLoading());
      final res = await repo.fetchOrderDetails(event.orderId);
      if (res.statusCode == 200) {
        emit(OrderDetailsLoaded(res.payload));
      }
    } catch (e) {
      emit(OrderFailure(e.toString()));
    }
  }
}
