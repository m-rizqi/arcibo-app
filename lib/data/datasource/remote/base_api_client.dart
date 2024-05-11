import 'dart:convert';

import 'package:arcibo/data/exception/server_exception.dart';
import 'package:arcibo/data/service/base_hive_service.dart';
import 'package:arcibo/data/service/interceptor/custom_interceptor.dart';
import 'package:arcibo/util/config/environment.dart';
import 'package:arcibo/util/constant/number_constant.dart';
import 'package:arcibo/util/constant/string_constant.dart';
import 'package:dio/dio.dart';

/// Base Api Client
class BaseApiClient {
  /// Class Initialization
  BaseApiClient({required this.hive});

  static const timeoutDuration = Duration(seconds: 15);

  final BaseHiveService hive;

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: timeoutDuration,
      receiveTimeout: timeoutDuration,
      sendTimeout: timeoutDuration,
    ),
  );

  Future<String> get({
    required String pathUrl,
    Map<String, dynamic>? params,
    String? path,
    String? customHost,
    String? customToken,
  }) async {
    _dio.options.headers['content-Type'] = StringConstant.httpApplicationJson;
    _dio.options.responseType = ResponseType.json;
    _dio.options.connectTimeout = timeoutDuration;
    _dio.options.receiveTimeout = timeoutDuration;

    _dio.interceptors.clear();
    _dio.interceptors.add(
      CustomInterceptor(
        hive: hive,
        customToken: customToken,
      ),
    );

    final newPathUrl = (customHost ?? Environment.apiUrl) + pathUrl;
    try {
      final res = await getGetResponse(newPathUrl, params, path);
      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<List<int>> getBytes({
    required String pathUrl,
    Map<String, dynamic>? params,
    String? path,
    String? customHost,
    String? customToken,
  }) async {
    _dio.options.headers['content-Type'] = StringConstant.httpApplicationJson;
    _dio.options.responseType = ResponseType.bytes;
    _dio.options.connectTimeout = timeoutDuration;
    _dio.options.receiveTimeout = timeoutDuration;

    _dio.interceptors.clear();
    _dio.interceptors.add(
      CustomInterceptor(
        hive: hive,
        customToken: customToken,
      ),
    );

    final newPathUrl = (customHost ?? Environment.apiUrl) + pathUrl;

    try {
      final res = await getGetResponse(newPathUrl, params, path);
      return res.data as List<int>;
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<String> post({
    required String pathUrl,
    Map<String, dynamic>? jsonBody,
    String? customHost,
    String? customToken,
    bool tokenEnabled = true,
  }) async {
    _dio.options.headers['content-Type'] = StringConstant.httpApplicationJson;
    _dio.options.connectTimeout = timeoutDuration;
    _dio.options.receiveTimeout = timeoutDuration;

    _dio.interceptors.clear();
    _dio.interceptors.add(
      CustomInterceptor(
        hive: hive,
        customToken: customToken,
        tokenEnabled: tokenEnabled,
      ),
    );

    final newPathUrl = (customHost ?? Environment.apiUrl) + pathUrl;

    try {
      final res = await getPostResponse(newPathUrl, jsonBody: jsonBody);

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<String> postFormData({
    required String pathUrl,
    FormData? formData,
    String? customHost,
    String? customToken,
  }) async {
    _dio.options.headers['content-Type'] = StringConstant.httpMultipartFormData;
    _dio.options.connectTimeout = timeoutDuration;
    _dio.options.receiveTimeout = timeoutDuration;

    _dio.interceptors.clear();
    _dio.interceptors.add(
      CustomInterceptor(
        hive: hive,
        customToken: customToken,
      ),
    );

    final newPathUrl = (customHost ?? Environment.apiUrl) + pathUrl;

    try {
      final res = await getPostResponse(newPathUrl, formData: formData);

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<String> put({
    required String pathUrl,
    Map<String, dynamic>? jsonBody,
    String? path,
    String? customHost,
    String? customToken,
  }) async {
    _dio.options.headers['content-Type'] = StringConstant.httpApplicationJson;
    _dio.options.connectTimeout = timeoutDuration;
    _dio.options.receiveTimeout = timeoutDuration;

    _dio.interceptors.clear();
    _dio.interceptors.add(
      CustomInterceptor(
        hive: hive,
        customToken: customToken,
      ),
    );

    final newPathUrl = (customHost ?? Environment.apiUrl) + pathUrl;

    try {
      final res = await getPutResponse(
        newPathUrl,
        jsonBody: jsonBody,
        path: path,
      );

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<String> putFormData({
    required String pathUrl,
    FormData? formData,
    String? path,
    String? customHost,
    String? customToken,
  }) async {
    _dio.options.headers['content-Type'] = StringConstant.httpMultipartFormData;
    _dio.options.connectTimeout = timeoutDuration;
    _dio.options.receiveTimeout = timeoutDuration;

    _dio.interceptors.clear();
    _dio.interceptors.add(
      CustomInterceptor(
        hive: hive,
        customToken: customToken,
      ),
    );

    final newPathUrl = (customHost ?? Environment.apiUrl) + pathUrl;

    try {
      final res = await getPutResponse(
        newPathUrl,
        formData: formData,
        path: path,
      );

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<String> putXWwwFormUrlEncoded({
    required String pathUrl,
    Map<String, dynamic>? jsonBody,
    String? path,
    String? customHost,
    String? customToken,
  }) async {
    _dio.options.headers['content-Type'] = StringConstant.httpXWwwFormUrlEncoded;
    _dio.options.connectTimeout = timeoutDuration;
    _dio.options.receiveTimeout = timeoutDuration;

    _dio.interceptors.clear();
    _dio.interceptors.add(
      CustomInterceptor(
        hive: hive,
        customToken: customToken,
      ),
    );

    final newPathUrl = (customHost ?? Environment.apiUrl) + pathUrl;

    try {
      final res = await getPutResponse(
        newPathUrl,
        jsonBody: jsonBody,
        path: path,
      );

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<String> delete({
    required String pathUrl,
    Map<String, dynamic>? jsonBody,
    String? path,
    String? customHost,
    String? customToken,
  }) async {
    _dio.options.headers['content-Type'] = StringConstant.httpApplicationJson;
    _dio.options.connectTimeout = timeoutDuration;
    _dio.options.receiveTimeout = timeoutDuration;

    _dio.interceptors.clear();
    _dio.interceptors.add(
      CustomInterceptor(
        hive: hive,
        customToken: customToken,
      ),
    );

    final newPathUrl = (customHost ?? Environment.apiUrl) + pathUrl;

    try {
      final res = await getDeleteResponse(
        newPathUrl,
        jsonBody: jsonBody,
        path: path,
      );

      return handleResponse(res);
    } catch (error) {
      throw handleError(error);
    }
  }

  Future<Response<dynamic>> getGetResponse(
    String pathUrl,
    Map<String, dynamic>? params,
    String? path,
  ) async {
    if (params != null) {
      return _dio.get(pathUrl, queryParameters: params);
    } else {
      if (path != null) {
        return _dio.get(pathUrl + path);
      } else {
        return _dio.get(pathUrl);
      }
    }
  }

  Future<Response<dynamic>> getPostResponse(
    String pathUrl, {
    Map<String, dynamic>? jsonBody,
    FormData? formData,
  }) async {
    if (jsonBody != null) {
      return _dio.post(pathUrl, data: jsonBody);
    } else if (formData != null) {
      return _dio.post(pathUrl, data: formData);
    } else {
      return _dio.post(pathUrl);
    }
  }

  Future<Response<dynamic>> getPutResponse(
    String pathUrl, {
    Map<String, dynamic>? jsonBody,
    FormData? formData,
    String? path,
  }) async {
    if (jsonBody != null) {
      return _dio.put(pathUrl + (path ?? ''), data: jsonBody);
    } else if (formData != null) {
      return _dio.put(pathUrl + (path ?? ''), data: formData);
    } else {
      return _dio.put(pathUrl + (path ?? ''));
    }
  }

  Future<Response<dynamic>> getDeleteResponse(
    String pathUrl, {
    Map<String, dynamic>? jsonBody,
    FormData? formData,
    String? path,
  }) async {
    if (jsonBody != null) {
      return _dio.delete(pathUrl + (path ?? ''), data: jsonBody);
    } else if (formData != null) {
      return _dio.delete(pathUrl + (path ?? ''), data: formData);
    } else {
      return _dio.delete(pathUrl + (path ?? ''));
    }
  }

  Future<String> handleResponse(Response<dynamic> res) async {
    var response = <String, dynamic>{};
    var encoded = '';
    try {
      if (res.toString() == '[]') {
        response = <String, dynamic>{'data': jsonDecode(res.toString()) as List<dynamic>};
        encoded = jsonEncode(response);
      } else {
        response = jsonDecode(res.toString()) as Map<String, dynamic>;
        encoded = jsonEncode(response);
      }
    } on FormatException catch (_) {
      final map = <String, dynamic>{'data': res.data as List<dynamic>};
      response = map;
      encoded = jsonEncode(response);
    }

    if (NumberConstant.httpStatusOk.contains(res.statusCode)) {
      return encoded;
    } else {
      throw ServerException(message: response['code'] as String);
    }
  }

  Exception handleError(Object error) {
    try {
      if (error is DioException) {
        final response = error.response;
        if (response != null) {
          final responseData = response.data as Map<String, dynamic>?;
          if (responseData != null) {
            final errorData = responseData['error'] as Map<String, dynamic>?;

            if (errorData != null) {
              final message = errorData['message'] as String? ?? 'Something went wrong';
              return ServerException(
                message: message,
                code: errorData['status'] as int?,
                path: response.requestOptions.path,
                errors: errorData['details']?.toString(),
              );
            }
          }
        }

        if (error.type == DioExceptionType.connectionTimeout) {
          return ServerException(message: 'Connect timeout');
        }
        if (error.type == DioExceptionType.badResponse) {
          return ServerException(message: 'Bad response');
        }
        if (error.type == DioExceptionType.connectionError) {
          return ServerException(message: 'Connection Error');
        }
        if (error.type == DioExceptionType.receiveTimeout) {
          return ServerException(message: 'Receive Timeout');
        }
        if (error.type == DioExceptionType.badCertificate) {
          return ServerException(message: 'Bad Certificate');
        }
        if (error.type == DioExceptionType.sendTimeout) {
          return ServerException(message: 'Send Timeout');
        }
      }
      return ServerException(message: 'Something went wrong: $error');
    } catch (e) {
      if (error is DioException) {
        if (error.response != null) {
          if (error.response!.statusCode == 500) {
            throw ServerException(message: 'Server Error');
          }
        }
      }
    }
    return ServerException(message: 'Something went wrong: $error');
  }
}
