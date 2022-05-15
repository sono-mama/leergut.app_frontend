class JwtModel {
  String? role;
  String? sub;
  int? iat;
  int? exp;

  JwtModel({this.role, this.sub, this.iat, this.exp});

  JwtModel.fromJson(Map<String, dynamic> json) {
    role = json['role'] as String;
    sub = json['sub'] as String;
    iat = json['iat'];
    exp = json['exp'];
  }
}