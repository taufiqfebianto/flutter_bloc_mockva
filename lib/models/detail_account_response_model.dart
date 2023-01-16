import 'dart:convert';

class DetailAccountResponseModel {
  DetailAccountResponseModel({
    this.id,
    this.name,
    this.username,
    this.balance,
  });

  String? id;
  String? name;
  String? username;
  String? balance;

  factory DetailAccountResponseModel.fromRawJson(String str) =>
      DetailAccountResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailAccountResponseModel.fromJson(Map<String, dynamic> json) =>
      DetailAccountResponseModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "balance": balance,
      };
}
