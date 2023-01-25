import 'dart:convert';

class TransferRequestModel {
  TransferRequestModel({
    this.accountSrcId,
    this.accountDstId,
    this.amount,
    this.inquiryId,
  });

  String? accountSrcId;
  String? accountDstId;
  double? amount;
  String? inquiryId;

  factory TransferRequestModel.fromRawJson(String str) =>
      TransferRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransferRequestModel.fromJson(Map<String, dynamic> json) =>
      TransferRequestModel(
        accountSrcId: json["accountSrcId"],
        accountDstId: json["accountDstId"],
        amount: json["amount"].toDouble(),
        inquiryId: json["inquiryId"],
      );

  Map<String, dynamic> toJson() => {
        "accountSrcId": accountSrcId,
        "accountDstId": accountDstId,
        "amount": amount,
        "inquiryId": inquiryId,
      };
}
