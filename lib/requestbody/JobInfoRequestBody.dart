import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class JobInfoRequestBody{
  String userId;
  String name;
  int money;
  List<DayAndTime>? dayAndTimes;

  JobInfoRequestBody({
    required this.userId,
    required this.name,
    required this.money,
    this.dayAndTimes,
  });


  factory JobInfoRequestBody.fromJson(Map<String, dynamic>json){
    return JobInfoRequestBody(
        userId: json['userId'],
        name: json['name'],
        money: json['money'],
        dayAndTimes: json['dayAndTimes']
    );
  }
}

class DayAndTime{
  String startTime;
  String finishTime;
  String day;

  DayAndTime({
    required this.startTime,
    required this.finishTime,
    required this.day
  });

  Map<String,String> toJson(){
    return {
      'startTime':startTime,
      "finishTime":finishTime,
      "day":day
    };
  }

}