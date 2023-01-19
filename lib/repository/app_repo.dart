import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_mockva/models/models.dart';

import '../shared/shared.dart';

class AppRepo {
  Future<LoginResponseModel> login() async {
    try {
      final Map<String, dynamic> parameters = {
        'username': 'username',
        'password': 'password',
      };

      Map<String, dynamic> data = await network.postHttp(
          path: Constants.login,
          content: parameters,
          contentType: 'application/json');
      return LoginResponseModel.fromJson(data);
    } on DioError catch (e) {
      throw e;
    }
  }
}
