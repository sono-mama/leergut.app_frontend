import 'dart:convert';

PastTransactionModel pastTransactionModelFromJson(String str) => PastTransactionModel.fromJson(json.decode(str));

String pastTransactionModelToJson(PastTransactionModel data) => json.encode(data.toJson());

class PastTransactionModel {
  PastTransactionModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.appUserRole,
    required this.transactions,
  });

  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String appUserRole;
  List<Transaction> transactions;

  factory PastTransactionModel.fromJson(Map<String, dynamic> json) => PastTransactionModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    username: json["username"],
    email: json["email"],
    appUserRole: json["appUserRole"],
    transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "username": username,
    "email": email,
    "appUserRole": appUserRole,
    "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
  };
}

class Transaction {
  Transaction({
    required this.id,
    required this.amount,
    required this.correspondingTransaction,
    required this.payedOut,
    required this.sequenceNumber,
  });

  String id;
  double amount;
  String correspondingTransaction;
  bool payedOut;
  int sequenceNumber;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    amount: json["amount"].toDouble(),
    correspondingTransaction: json["correspondingTransaction"],
    payedOut: json["payedOut"],
    sequenceNumber: json["sequenceNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "correspondingTransaction": correspondingTransaction,
    "payedOut": payedOut,
    "sequenceNumber": sequenceNumber,
  };
}
