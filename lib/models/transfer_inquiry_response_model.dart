import 'dart:convert';

class TransferInquiryResponseModel {
  TransferInquiryResponseModel({
    this.inquiryId,
    this.accountSrcId,
    this.accountDstId,
    this.accountSrcName,
    this.accountDstName,
    this.amount,
  });

  String? inquiryId;
  String? accountSrcId;
  String? accountDstId;
  String? accountSrcName;
  String? accountDstName;
  int? amount;

  factory TransferInquiryResponseModel.fromRawJson(String str) =>
      TransferInquiryResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransferInquiryResponseModel.fromJson(Map<String, dynamic> json) =>
      TransferInquiryResponseModel(
        inquiryId: json["inquiryId"],
        accountSrcId: json["accountSrcId"],
        accountDstId: json["accountDstId"],
        accountSrcName: json["accountSrcName"],
        accountDstName: json["accountDstName"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "inquiryId": inquiryId,
        "accountSrcId": accountSrcId,
        "accountDstId": accountDstId,
        "accountSrcName": accountSrcName,
        "accountDstName": accountDstName,
        "amount": amount,
      };
}
