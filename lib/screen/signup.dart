import "dart:js_interop";

import "package:flutter/material.dart";
import "package:ok_client/controller/SignupController.dart";
import "package:ok_client/requestbody/LoginRequest.dart";
import "package:ok_client/responsebody/LoginResponse.dart";
import "package:ok_client/screen/JobInfo.dart";


class SignupPage extends StatefulWidget{
  const SignupPage({Key? key}): super(key:key);

  @override
  SingupState createState() => SingupState();
}

class SingupState extends State<SignupPage>{
  final _nameEditingController = TextEditingController();
  final _idEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _passwordCheckingController = TextEditingController();
  var request = LoginRequestBody(id: "", password: "");
  var response = LoginResponseBody(id: "", password: "", name: "", result: false);


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        title:  const Text(
          "회원가입",
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Flexible(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    TextField(
                      controller: _nameEditingController,
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
                      controller: _idEditingController,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "아이디를 입력하세요",
                        hintStyle: TextStyle(
                          color: Color(0xff828181),
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(Icons.vpn_key_outlined),
                        filled: true,
                        fillColor: Color(0xffEEEEEE),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),

                    TextField(
                      controller: _passwordEditingController,
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
                        prefixIcon: Icon(Icons.lock_outline),
                        filled: true,
                        fillColor: Color(0xffEEEEEE),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),

                    TextField(
                      controller: _passwordCheckingController,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "비밀번호를 다시 입력하세요",
                        hintStyle: TextStyle(
                          color: Color(0xff828181),
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(Icons.check_circle_outline),
                        filled: true,
                        fillColor: Color(0xffEEEEEE),
                      ),
                    ),

                  ],
                ),
              ),

              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffA1A8D6),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text("등록하기",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: (){
                      request.id = _idEditingController.text;
                      request.password = _passwordEditingController.text;
                      request.name = _nameEditingController.text;

                      Signup(request).then((value) =>
                        response = value,


                      );
                      addForm(response);



                    },
                  ),
                ),)
            ],
          ),
        ),
      ),

    );
  }

  void addForm(LoginResponseBody responseBody){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JobInfoPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffA1A8D6),
                //padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text("추가정보를 등록하세요",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}