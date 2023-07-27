import 'package:flutter/material.dart';
import 'dart:io';
import 'package:ok_client/controller/Logincontroller.dart';
import 'package:ok_client/requestbody/LoginRequest.dart';
import 'package:ok_client/responsebody/LoginResponse.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _contentEditController = TextEditingController();
  var id="";
  var password="";
  Future<LoginResponseBody>? login;
  var res = LoginResponseBody(id: "", password: "", name: "", result: false);
  var requestBody = LoginRequestBody(id: "4", password: "4");
  int flag = 0;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Login"),
            TextField(
              controller: _contentEditController,
              decoration: InputDecoration(
                labelText: "id",
              ),
              onSubmitted:  (text) async{
                id=text;
                password=text;

                requestBody.id = id;
                requestBody.password = password;

                Login(requestBody).then((value) =>
                    setState((){
                      flag=1;
                      res = value;
                    }),
                );



              },
            ),
            buildColumn(res),
          ],
        ),
      ),
    );
  }





  Widget buildColumn(LoginResponseBody value) {
    if(flag==1){
      print(value.id);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('id:' + value.id,
              style: TextStyle(fontSize: 20)),
          Text('password:' + value.password,
              style: TextStyle(fontSize: 20)),
        ],
      );
    }
    else{
      return Text("실패");
    }

  }
}
