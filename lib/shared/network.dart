import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_mockva/shared/shared.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Network {
  final _dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        // 'Content-Type': 'application/json',
        'Basic':
            'NmFhNjE2MGQtMjcyMC00MDgwLTg2NzMtNWRiYmQ0ODJkNGZlOjJjNjhtNjZiOWo5N2IyZmZwdHZ4ZWJqeTl2b3Y1ZjhsaGdrOTNnNWpoZ2txeDRpNTg1MjRvM2o3MTNjaXQzeHo='
      },
    ),
  );

  Network() {
    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 120),
    );
  }

  Future<dynamic> postHttp({
    @required String? path,
    Map<String, dynamic>? parameter,
    @required Map<String, dynamic>? content,
    @required String? contentType,
  }) async {
    _dio.options.responseType = ResponseType.json;

    Map<String, dynamic> headers = {
      'content-type': contentType,
      'Accept': contentType,
    };
    // String sessionId = await storage.getString(
    //     boxName: describeEnum(StorageConstants.user), key: 'sessionId');
    // if (sessionId.isNotEmpty) {
    //   headers['sessionId'] = sessionId;
    // }

    _dio.options.headers = headers;
    try {
      Response response;

      response =
          await _dio.post(path!, queryParameters: parameter, data: content);

      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }
}

final network = Network();
