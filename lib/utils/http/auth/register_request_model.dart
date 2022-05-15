class RegisterRequestModel {
  String? username;
  String? email;
  String? firstname;
  String? lastname;
  String? password;

  RegisterRequestModel({this.username, this.email, this.firstname, this.lastname, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['firstName'] = firstname;
    data['lastName'] = lastname;
    data['password'] = password;

    return data;
  }
}