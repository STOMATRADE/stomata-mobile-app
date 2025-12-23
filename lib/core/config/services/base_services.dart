import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:stomata_app/core/config/firebase/firebase_remote_config_utils.dart';
import 'package:stomata_app/core/utils/cache_manager.dart';
import 'package:stomata_app/core/utils/logging.dart';

class BaseServices with CacheManager {
  final Dio _dio = Dio();

  String path = "";
  String token = "";
  Map<String, String>? headers;

  Future<FirebaseRemoteConfig> _initRemoteConfig() async {
    FirebaseRemoteConfig remoteConfigUtils = await FirebaseRemoteConfigUtils()
        .getRemoteConfig();

    return remoteConfigUtils;
  }

  _initEndpoint() async {
    var remoteConfig = await _initRemoteConfig();

    try {
      path = remoteConfig.getString('baseUrlNew');
      printLog("Base URL: $path");
    } catch (e) {
      printLog('Failed to fetch remote config: $e');
    }
  }

  _initBaseServices() async {
    String bearerToken = await getBearerToken();
    printLog("token : $token");

    headers = bearerToken.isNotEmpty
        ? {'accept': 'application/json', 'Authorization': bearerToken}
        : {'Content-Type': 'application/json', 'accept': 'application/json'};

    printLog("Header : ${jsonEncode(headers)}");

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            return handler.resolve(
              Response(
                requestOptions: e.requestOptions,
                data:
                    e.response?.data ??
                    {
                      "data": null,
                      "status": {
                        "code": 401,
                        "message": "Unauthorized access.",
                      },
                    },
                statusCode: 401,
              ),
            );
          }
          if (e.response?.statusCode == 404) {
            return handler.resolve(
              Response(
                requestOptions: e.requestOptions,
                data:
                    e.response?.data ??
                    {
                      "data": null,
                      "status": {"code": 404, "message": "not found"},
                    },
                statusCode: 401,
              ),
            );
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> postApi<T>({
    required Map<String, dynamic> params,
    required String endpoint,
  }) async {
    await _initBaseServices();
    await _initEndpoint();

    printLog("REQUEST PARAM : ${jsonEncode(params)}");

    try {
      var response = await _dio.post(
        "$path$endpoint",
        data: params,
        options: Options(headers: headers),
      );

      printLog("$path$endpoint RESPONSE : ${jsonEncode(response.data)}");

      return response;
    } on DioException catch (e) {
      printLog("$path$endpoint RESPONSE : ${jsonEncode(e.response)}");
      printLog("Dio Error: $e");

      return e.response!;
    } catch (e) {
      printLog("$path$endpoint RESPONSE : $e");
      rethrow;
    }
  }

  Future<Response> getApi<T>({
    required String endpoint,
    Map<String, dynamic>? params,
  }) async {
    await _initBaseServices();
    await _initEndpoint();

    try {
      var response = await _dio.get(
        endpoint,
        options: Options(headers: headers),
        queryParameters: params,
      );

      printLog("$path$endpoint Response : ${jsonEncode(response.data)}");

      return response;
    } on DioException catch (e) {
      printLog("$path$endpoint Response : ${jsonEncode(e.response)}");
      printLog("Dio Error: $e");

      return e.response!;
    } catch (e) {
      printLog("$path$endpoint Response : $e");
      rethrow;
    }
  }
}
