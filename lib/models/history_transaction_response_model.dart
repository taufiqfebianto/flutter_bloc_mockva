import 'dart:convert';

class HistoryTransactionResponseModel {
  HistoryTransactionResponseModel({
    this.id,
    this.accountSrcId,
    this.accountDstId,
    this.clientRef,
    this.amount,
    this.transactionTimestamp,
  });

  String? id;
  String? accountSrcId;
  String? accountDstId;
  String? clientRef;
  int? amount;
  DateTime? transactionTimestamp;

  factory HistoryTransactionResponseModel.fromRawJson(String str) =>
      HistoryTransactionResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryTransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      HistoryTransactionResponseModel(
        id: json["id"],
        accountSrcId: json["accountSrcId"],
        accountDstId: json["accountDstId"],
        clientRef: json["clientRef"],
        amount: json["amount"],
        transactionTimestamp: DateTime.parse(json["transactionTimestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountSrcId": accountSrcId,
        "accountDstId": accountDstId,
        "clientRef": clientRef,
        "amount": amount,
        "transactionTimestamp": transactionTimestamp?.toIso8601String(),
      };
}
