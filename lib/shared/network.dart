import 'package:dio/dio.dart';
import 'package:flutter_bloc_mockva/shared/shared.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Network {
  final _dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        'Content-Type': 'application/json',
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
          maxWidth: 100),
    );
  }
}

final network = Network();
