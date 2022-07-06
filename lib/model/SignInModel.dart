/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyYjVhZGM4OGIzMzlhMDAxNjgxODc4NiIsImlhdCI6MTY1NzA5MjkwMH0.ZOn7jd-Y8dslJL0JpVkP4NZMHmBjN8EG3cwz5oDQZV8"
/// user : {"address":{"latitude":72.00032,"longitude":26.0005},"_id":"62b5adc88b339a0016818786","first_name":"Ekta4","last_name":"Arora","email":"ekt5@gmail.com","password":"$2a$10$uGePh8dUTv16o.pvygMSxOxSWXMqX9a1mC9TKdxfCPjyHhwwBnPdG","username":"ektaarora5","phone_number":"9876543223","__v":0}

class SignInModel {
  SignInModel({
      String? token, 
      User? user,}){
    _token = token;
    _user = user;
}

  SignInModel.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _token;
  User? _user;
SignInModel copyWith({  String? token,
  User? user,
}) => SignInModel(  token: token ?? _token,
  user: user ?? _user,
);
  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// address : {"latitude":72.00032,"longitude":26.0005}
/// _id : "62b5adc88b339a0016818786"
/// first_name : "Ekta4"
/// last_name : "Arora"
/// email : "ekt5@gmail.com"
/// password : "$2a$10$uGePh8dUTv16o.pvygMSxOxSWXMqX9a1mC9TKdxfCPjyHhwwBnPdG"
/// username : "ektaarora5"
/// phone_number : "9876543223"
/// __v : 0

class User {
  User({
      Address? address, 
      String? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? password, 
      String? username, 
      String? phoneNumber, 
      int? v,}){
    _address = address;
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
    _username = username;
    _phoneNumber = phoneNumber;
    _v = v;
}

  User.fromJson(dynamic json) {
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _id = json['_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _password = json['password'];
    _username = json['username'];
    _phoneNumber = json['phone_number'];
    _v = json['__v'];
  }
  Address? _address;
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;
  String? _username;
  String? _phoneNumber;
  int? _v;
User copyWith({  Address? address,
  String? id,
  String? firstName,
  String? lastName,
  String? email,
  String? password,
  String? username,
  String? phoneNumber,
  int? v,
}) => User(  address: address ?? _address,
  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  password: password ?? _password,
  username: username ?? _username,
  phoneNumber: phoneNumber ?? _phoneNumber,
  v: v ?? _v,
);
  Address? get address => _address;
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get password => _password;
  String? get username => _username;
  String? get phoneNumber => _phoneNumber;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['_id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['password'] = _password;
    map['username'] = _username;
    map['phone_number'] = _phoneNumber;
    map['__v'] = _v;
    return map;
  }

}

/// latitude : 72.00032
/// longitude : 26.0005

class Address {
  Address({
      double? latitude, 
      double? longitude,}){
    _latitude = latitude;
    _longitude = longitude;
}

  Address.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  double? _latitude;
  double? _longitude;
Address copyWith({  double? latitude,
  double? longitude,
}) => Address(  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
);
  double? get latitude => _latitude;
  double? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}