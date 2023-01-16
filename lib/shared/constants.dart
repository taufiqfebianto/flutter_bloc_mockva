class Constants {
  static const String baseUrl = 'https://mockva.daksa.co.id/mockva-rest';
  static const String apiKey = '6aa6160d-2720-4080-8673-5dbbd482d4fe';
  static const String secretKey =
      '2c68m66b9j97b2ffptvxebjy9vov5f8lhgk93g5jhgkqx4i58524o3j713cit3xz';

  static const String login = '/rest/auth/login';
  static const String detailAccount = '/rest/account/detail';
  static const String transferInquiry =
      '/rest/account/transaction/transferInquiry';
  static const String transfer = '/rest/account/transaction/transfer';
  static const String history = '/rest/account/transaction/log/fetch';
  static const String historyCount = '/rest/account/transaction/log/count';
  static const String logout = '/rest/auth/logout';
}
