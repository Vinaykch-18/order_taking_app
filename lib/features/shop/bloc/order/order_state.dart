import 'package:equatable/equatable.dart';
import '../../models/order_history_model.dart';
import '../../models/order_detail_model.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderLoading extends OrderState {}

class OrdersLoaded extends OrderState {
  final List<OrderHistory> orders;
  OrdersLoaded(this.orders);
}

class OrderDetailsLoaded extends OrderState {
  final OrderDetail detail;
  OrderDetailsLoaded(this.detail);
}
class OrderFailure extends OrderState {
  final String message;

  OrderFailure(this.message);

  @override
  List<Object?> get props => [message];
}