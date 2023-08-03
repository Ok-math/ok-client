import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ok_client/controller/LoginController.dart';
import 'package:ok_client/requestbody/LoginRequest.dart';
import 'package:ok_client/responsebody/LoginResponse.dart';
import 'package:ok_client/screen/calender.dart';
import 'package:ok_client/screen/signup.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _idEditController = TextEditingController();
  final _passwordEditController = TextEditingController();
  var id="";
  var password="";
  Future<LoginResponseBody>? login;
  var res = LoginResponseBody(id: "", password: "", name: "", result: false);
  var requestBody = LoginRequestBody(id: "4", password: "4");
  int flag = 0;
  String userName = "";





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        title: Text(
          "로그인",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffFAFAFA),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _idEditController,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "이름을 입력하세요",
                  hintStyle: TextStyle(
                    color: Color(0xff828181),
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(Icons.person_outline),
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: _passwordEditController,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "비밀번호를 입력하세요",
                  hintStyle: TextStyle(
                    color: Color(0xff828181),
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(Icons.lock_outlined),
                  filled: true,
                  fillColor: Color(0xffEEEEEE),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),

              Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      //회원가입 창
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffD9D9D9),
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("회원가입",
                        style: TextStyle(
                            color: Colors.black,
                          fontSize: 16,
                        ),),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),


                  Flexible(
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      onPressed: (){
                        id = _idEditController.text;
                        password = _passwordEditController.text;
                        requestBody.id = id;
                        requestBody.password = password;

                        userName = requestBody.id;

                        Login(requestBody).then((value)=>
                            res = value,

                          //main페이지로 이동 함수(userId 파라미터)
                        );

                        //로그인이 성공하면
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CalenderPage(userName:userName)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffD9D9D9),
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("로그인",
                        style: TextStyle(
                            color: Colors.black,
                          fontSize: 16,
                        ),),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
