import 'dart:convert';

class TransferResponseModel {
  TransferResponseModel({
    this.accountSrcId,
    this.accountDstId,
    this.amount,
    this.transactionTimestamp,
    this.clientRef,
  });

  String? accountSrcId;
  String? accountDstId;
  int? amount;
  DateTime? transactionTimestamp;
  String? clientRef;

  factory TransferResponseModel.fromRawJson(String str) =>
      TransferResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransferResponseModel.fromJson(Map<String, dynamic> json) =>
      TransferResponseModel(
        accountSrcId: json["accountSrcId"],
        accountDstId: json["accountDstId"],
        amount: json["amount"],
        transactionTimestamp: DateTime.parse(json["transactionTimestamp"]),
        clientRef: json["clientRef"],
      );

  Map<String, dynamic> toJson() => {
        "accountSrcId": accountSrcId,
        "accountDstId": accountDstId,
        "amount": amount,
        "transactionTimestamp": transactionTimestamp?.toIso8601String(),
        "clientRef": clientRef,
      };
}
