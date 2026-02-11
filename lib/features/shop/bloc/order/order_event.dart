import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchOrders extends OrderEvent {
  final int userId;
  FetchOrders(this.userId);
}

class FetchOrderDetails extends OrderEvent {
  final int orderId;
  FetchOrderDetails(this.orderId);
}
