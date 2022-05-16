class PayoutResponseModel {
  String? status;

  PayoutResponseModel({this.status});

  PayoutResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }
}

