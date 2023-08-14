import 'package:http/http.dart' as http;
import 'package:ok_client/requestbody/LoginRequest.dart';
import 'dart:async';
import 'dart:convert';
import 'package:ok_client/responsebody/LoginResponse.dart';


Future<LoginResponseBody> Signup(LoginRequestBody requestBody) async{
  var responseBody = LoginResponseBody(id: "0", password: "0", name: "0", result: true);
  var response = await http.post(
    //안드로이드 기기에서 작동시 localhost 대신 무선LAN IPv4값으로 수정
    Uri.parse('http://172.30.1.34:8080/user/signup'),
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    },
    body: jsonEncode({
      "id": requestBody.id,
      "password": requestBody.password,
      "name": requestBody.name,
    }),
  );

  if(response.statusCode == 200){
    print("ok200");
    responseBody = LoginResponseBody.fromJson(json.decode(response.body));
    print(responseBody.id);
    print(responseBody.name);
    print(responseBody.result);
    return responseBody;
  }
  else{
    return responseBody;
  }
}