import "package:flutter/material.dart";



class JobInfoPage extends StatefulWidget{
  const JobInfoPage({Key? key}): super(key:key);

  @override
  _JobInfoState createState() => _JobInfoState();
}

class _JobInfoState extends State<JobInfoPage>{
  // final _nameEditingController = TextEditingController();
  // final _idEditingController = TextEditingController();
  // final _passwordEditingController = TextEditingController();
  // final _passwordCheckingController = TextEditingController();
  // var request = LoginRequestBody(id: "", password: "");
  // var response = LoginResponseBody(id: "", password: "", name: "", result: false);


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        title:  const Text(
          "알바정보 추가",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffFAFAFA),
        elevation: 0,
      ),


    );
  }
}