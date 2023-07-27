import 'package:http/http.dart' as http;
import 'package:ok_client/requestbody/LoginRequest.dart';
import 'dart:async';
import 'dart:convert';
import 'package:ok_client/responsebody/LoginResponse.dart';


Future<LoginResponseBody> Login(LoginRequestBody requestBody) async{
  LoginResponseBody responseBody;
  var res = LoginResponseBody(id: "0", password: "0", name: "0", result: true);
  var response = await http.post(
      Uri.parse('http://localhost:8080/user/signup'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
    body: jsonEncode({
      "id": requestBody.id,
      "password": requestBody.password,
    }),
  );

  if(response.statusCode == 200){
    print("ok200");
    res = LoginResponseBody.fromJson(json.decode(response.body));
    print(res.id);
    print(res.name);
    return res;
  }
  else{
    return res;
  }
  //return LoginResponseBody.fromJson(json.decode(response.body));
}