import 'dart:convert';


import 'package:equatable/equatable.dart';

PastTransactionModel pastTransactionModelFromJson(String str) => PastTransactionModel.fromJson(json.decode(str));

String pastTransactionModelToJson(PastTransactionModel data) => json.encode(data.toJson());

class PastTransactionModel extends Equatable {
  const PastTransactionModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.appUserRole,
    required this.transactions,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String appUserRole;
  final List<Transaction> transactions;

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

  @override
  List<Object?> get props => [id, firstName, lastName, username, email, appUserRole, transactions];
}

class Transaction extends Equatable {
  const Transaction({
    required this.id,
    required this.amount,
    required this.correspondingTransaction,
    required this.payedOut,
    required this.sequenceNumber,
  });

  final String id;
  final double amount;
  final String correspondingTransaction;
  final bool payedOut;
  final int sequenceNumber;

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

  @override
  List<Object?> get props => [id, amount, correspondingTransaction, payedOut, sequenceNumber];
}
