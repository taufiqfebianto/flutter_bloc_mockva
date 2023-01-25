import 'dart:convert';

class TransferInquiryRequestModel {
  TransferInquiryRequestModel({
     this.accountSrcId,
     this.accountDstId,
     this.amount,
  });

  String? accountSrcId;
  String? accountDstId;
  double? amount;

  factory TransferInquiryRequestModel.fromRawJson(String str) =>
      TransferInquiryRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransferInquiryRequestModel.fromJson(Map<String, dynamic> json) =>
      TransferInquiryRequestModel(
        accountSrcId: json["accountSrcId"],
        accountDstId: json["accountDstId"],
        amount: json["amount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "accountSrcId": accountSrcId,
        "accountDstId": accountDstId,
        "amount": amount,
      };
}
