import "package:flutter/material.dart";

class Signup extends StatelessWidget{
  const Signup({Key? key}): super(key:key);

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

    );
  }
}