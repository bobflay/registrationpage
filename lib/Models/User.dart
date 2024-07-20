import 'dart:convert';

class User {
  final String name;
  final String email;
  final String phone;
  final String? password;


  User({
    required this.name,
    required this.email,
    required this.phone,
    this.password
  });

  Map<String,dynamic> ToMap(){
    return {
      'name':name,
      'email':email,
      'password':password,
      'phone':phone
    };
  }

  String toJson() => json.encode(ToMap());


}