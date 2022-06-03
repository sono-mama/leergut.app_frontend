import 'package:frontend/utils/http/past_transaction_model.dart';

class BalanceCalc {
  double balance = 0;

  double calculateBalance(List<Transaction> transactions) {
    for (var element in transactions) {
      {
        if (!element.payedOut) {
          balance += element.amount;
        }
      }
    }
    return balance;
  }
}
