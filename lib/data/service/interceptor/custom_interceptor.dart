import 'dart:convert';
import 'dart:developer';

import 'package:arcibo/data/service/base_hive_service.dart';
import 'package:arcibo/data/service/secure_storage_service.dart';
import 'package:arcibo/util/config/environment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CustomInterceptor extends Interceptor {
  CustomInterceptor({
    required this.hive,
    this.customToken,
    this.tokenEnabled = true,
  });

  final BaseHiveService hive;
  final String? customToken;
  final bool tokenEnabled;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Accept'] = '*/*';
    options.headers['origin'] = Environment.apiUrl;
    options
      ..connectTimeout = const Duration(milliseconds: 5000)
      ..receiveTimeout = const Duration(milliseconds: 120000)
      ..sendTimeout = const Duration(milliseconds: 120000);

    if (tokenEnabled) {
      final token = customToken ?? await secureStorageService.getToken();
      if (token != null) options.headers['Authorization'] = 'Bearer $token';
    }

    if (!kReleaseMode) {
      final formattedData = _formatRequestData(options.data);

      log('🔵 REQUEST > ${options.method} | ${options.path} | PARAM: ${options.queryParameters} | DATA: $formattedData | HEADERS: ${options.headers}');
      if (options.data is FormData) {
        log('FORM DATA ${(options.data as FormData).fields}');
      }
    }

    return super.onRequest(options, handler);
  }

  String _formatRequestData(dynamic data) {
    try {
      if (data is String) {
        return data;
      } else {
        final jsonData = json.decode(json.encode(data));
        return const JsonEncoder.withIndent('  ').convert(jsonData);
      }
    } catch (e) {
      return 'Unable to format data: $e';
    }
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (!kReleaseMode) {
      final formattedResponse = _formatRequestData(response.data);

      log('🟠 RESPONSE > ${response.requestOptions.method} | ${response.requestOptions.path} | RESPONSE: $formattedResponse');
    }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (!kReleaseMode) {
      try {
        log('🛑 ERROR > $err | ${err.requestOptions.path} | ${err.message} | ${err.response} | ${jsonEncode(err.requestOptions.data)}');
      } catch (e) {
        log('🛑 ERROR > $err | ${err.requestOptions.path} | ${err.message} | ${err.response}');
      }
    }
    final response = err.response;
    if (response != null) {
      final responseData = response.data as Map<String, dynamic>?;
      if (responseData != null) {
        final errorData = responseData['error'] as Map<String, dynamic>?;

        if (errorData != null) {
          final name = errorData['name'];
          if (name == 'UnauthorizedError') {
            await secureStorageService.deleteToken();
          }
        }
      }
    }
    super.onError(err, handler);
  }
}
