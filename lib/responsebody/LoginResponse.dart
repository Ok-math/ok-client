import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class LoginResponseBody{
  final String id;
  final String password;
  final String name;
  final bool result;

  LoginResponseBody({
    required this.id,
    required this.password,
    required this.name,
    required this.result,
  });


  factory LoginResponseBody.fromJson(Map<String, dynamic>json){
    return LoginResponseBody(
      id: json["id"] ?? 'null',
      password: json["password"] ?? 'null',
      name: json["name"] ?? 'null',
      result: json["result"] as bool,
    );
  }
}