import 'package:dio/dio.dart';
import 'package:flutter_bloc_mockva/models/models.dart';

import '../shared/shared.dart';

class AppRepo {
  Future<LoginResponseModel> signIn(
      {required String username, required String password}) async {
    try {
      final Map<String, dynamic> parameters = {
        'username': username,
        'password': password,
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

  Future<bool> signOut() async {
    try {
      // final Map<String, dynamic> parameters = {
      //   '_sessionId': 'sessionId',
      // };

      await network.deleteHttp(
          path: Constants.logout,
          // content: parameters,
          contentType: 'application/json');
      return true;
    } on DioError {
      return false;
    }
  }
}
