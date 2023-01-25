// ignore_for_file: use_rethrow_when_possible

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
      await network.deleteHttp(
          path: Constants.logout, contentType: 'application/json');
      return true;
    } on DioError {
      return false;
    }
  }

  Future<DetailAccountResponseModel> getAccountDetail() async {
    String id = await storage.getString(
        boxName: describeEnum(StorageConstants.user), key: 'accountId');
    try {
      final Map<String, dynamic> parameters = {
        'id': id,
      };

      Map<String, dynamic> data = await network.getHttp(
          path: Constants.detailAccount,
          parameter: parameters,
          contentType: 'application/json');
      return DetailAccountResponseModel.fromJson(data);
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<TransferInquiryResponseModel> transferInquiry(
      {required TransferInquiryRequestModel model}) async {
    try {
      Map<String, dynamic> data = await network.postHttp(
          path: Constants.transferInquiry,
          content: model.toJson(),
          contentType: 'application/json');
      return TransferInquiryResponseModel.fromJson(data);
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<TransferResponseModel> transferConfirmation(
      {required TransferRequestModel model}) async {
    try {
      Map<String, dynamic> data = await network.postHttp(
          path: Constants.transfer,
          content: model.toJson(),
          contentType: 'application/json');
      return TransferResponseModel.fromJson(data);
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<HistoryTransactionResponseModel> getTransactionList() async {
    String id = await storage.getString(
        boxName: describeEnum(StorageConstants.user), key: 'accountId');
    try {
      final Map<String, dynamic> parameters = {
        'id': id,
      };

      Map<String, dynamic> data = await network.getHttp(
          path: Constants.history,
          parameter: parameters,
          contentType: 'application/json');
      return HistoryTransactionResponseModel.fromJson(data);
    } on DioError catch (e) {
      throw e;
    }
  }
}
