import "package:flutter/material.dart";

class Calenderpage extends StatelessWidget{
  const Calenderpage({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        title:  const Text(
          "시급계산기",
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