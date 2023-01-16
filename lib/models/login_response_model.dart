import 'dart:convert';

class LoginResponseModel {
  LoginResponseModel({
    this.id,
    this.accountId,
    this.lastLoginTimestamp,
    this.sessionStatus,
  });

  String? id;
  String? accountId;
  DateTime? lastLoginTimestamp;
  String? sessionStatus;

  factory LoginResponseModel.fromRawJson(String str) =>
      LoginResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["id"],
        accountId: json["accountId"],
        lastLoginTimestamp: DateTime.parse(json["lastLoginTimestamp"]),
        sessionStatus: json["sessionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountId": accountId,
        "lastLoginTimestamp": lastLoginTimestamp?.toIso8601String(),
        "sessionStatus": sessionStatus,
      };
}
