import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class LoginRequestBody{
  String id;
  String password;

  LoginRequestBody({
    required this.id,
    required this.password
  });


  factory LoginRequestBody.fromJson(Map<String, dynamic>json){
    return LoginRequestBody(
        id: json['id'],
        password: json['password']
    );
  }
}