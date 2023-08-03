import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class JobInfoResponseBody{
  final int id;
  final String name;
  final bool result;

  JobInfoResponseBody({
    required this.id,
    required this.name,
    required this.result,
  });


  factory JobInfoResponseBody.fromJson(Map<String, dynamic>json){
    return JobInfoResponseBody(
      id: json["id"] ?? 'null',
      name: json["name"] ?? 'null',
      result: json["result"] as bool,
    );
  }
}