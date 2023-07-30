import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class LoginRequestBody{
  String id;
  String password;
  String? name;

  LoginRequestBody({
    required this.id,
    required this.password,
    this.name
  });


  factory LoginRequestBody.fromJson(Map<String, dynamic>json){
    return LoginRequestBody(
        id: json['id'],
        password: json['password'],
        name: json['name']
    );
  }
}