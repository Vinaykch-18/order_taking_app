import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/api_response.dart';

class AuthRepository {
  final Dio _dio = DioClient.dio;

  Future<ApiResponse<Map<String, dynamic>>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {'username': username, 'password': password},
      );

      return ApiResponse.fromJson(
        response.data,
        (payload) => payload as Map<String, dynamic>,
      );
    } catch (e) {
      rethrow;
    }
  }
}
