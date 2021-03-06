class SignupRequestModel {
  String? email;
  String? username;
  String? password;

  SignupRequestModel({this.email, this.username, this.password});

  SignupRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
