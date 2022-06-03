class TransactionResponseModel {
  String? status;

  TransactionResponseModel({this.status});

  TransactionResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }
}

