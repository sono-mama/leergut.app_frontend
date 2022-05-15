class TransactionModel {
  String? shopTransaction;


  TransactionModel({this.shopTransaction});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shopTransaction'] = shopTransaction;
      return data;
  }


}