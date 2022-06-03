class RegisterResponseModel {
  String? status;

  RegisterResponseModel({this.status});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as String;
  }
}