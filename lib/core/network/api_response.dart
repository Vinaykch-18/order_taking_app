class ApiResponse<T> {
  final String timestamp;
  final int statusCode;
  final String message;
  final T payload;

  ApiResponse({
    required this.timestamp,
    required this.statusCode,
    required this.message,
    required this.payload,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResponse<T>(
      timestamp: json['timestamp'],
      statusCode: json['statusCode'],
      message: json['message'],
      payload: fromJsonT(json['payload']),
    );
  }
}
