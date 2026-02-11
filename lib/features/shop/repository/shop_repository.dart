import '../../../core/network/dio_client.dart';
import '../../../core/network/api_response.dart';
import '../models/product_model.dart';
import '../models/order_history_model.dart';
import '../models/order_detail_model.dart';

class ShopRepository {

  Future<ApiResponse<List<Product>>> fetchProducts() async {
    final res = await DioClient.dio.get('/products');
    return ApiResponse.fromJson(
      res.data,
      (p) => (p as List).map((e) => Product.fromJson(e)).toList(),
    );
  }

  Future<ApiResponse<List<OrderHistory>>> fetchOrders(int userId) async {
    final res = await DioClient.dio.get(
      '/orders',
      queryParameters: {'userId': userId},
    );

    return ApiResponse.fromJson(
      res.data,
      (p) => (p as List)
          .map((e) => OrderHistory.fromJson(e))
          .toList(),
    );
  }

  Future<ApiResponse<OrderDetail>> fetchOrderDetails(int orderId) async {
    final res = await DioClient.dio.get('/orders/$orderId');

    return ApiResponse.fromJson(
      res.data,
      (p) => OrderDetail.fromJson(p),
    );
  }

  Future<ApiResponse<void>> placeOrder(int userId, List items) async {
    final res = await DioClient.dio.post(
      '/orders',
      data: {
        'userId': userId,
        'items': items,
      },
    );

    return ApiResponse.fromJson(res.data, (_) {});
  }
}
