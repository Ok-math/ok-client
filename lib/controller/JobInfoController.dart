import 'package:http/http.dart' as http;
import 'package:ok_client/requestbody/JobInfoRequestBody.dart';
import 'dart:async';
import 'dart:convert';
import 'package:ok_client/responsebody/JobInfoResponseBody.dart';



Future<JobInfoResponseBody> Jobinfo_save(JobInfoRequestBody requestBody) async{
  var responseBody = JobInfoResponseBody(id: 0, name: "0", result: true);
  var response = await http.post(
    //안드로이드 기기에서 작동시 localhost 대신 무선LAN IPv4값으로 수정
    Uri.parse('http://172.30.1.34:8080/jobinfo/save'),
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    },
    body: jsonEncode({
      "userId": requestBody.userId,
      "name": requestBody.name,
      "money": requestBody.money,
      "dayAndTimes" : listToJson(requestBody.dayAndTimes!)
    }),
  );

  print(jsonEncode({
    "userId": requestBody.userId,
    "name": requestBody.name,
    "money": requestBody.money,
    "dayAndTimes" : listToJson(requestBody.dayAndTimes!)
  }));

  if(response.statusCode == 200){
    print("ok200");
    responseBody = JobInfoResponseBody.fromJson(json.decode(response.body));
    print(responseBody.id);
    print(responseBody.name);
    print(responseBody.result);
    return responseBody;
  }
  else{
    return responseBody;
  }




}

List<Map<String,String>> listToJson(List<DayAndTime> list){
  List<Map<String,String>> items = [];

  for(int i=0;i<list.length;i++){
    var item = list[i].toJson();
    items.add(item);
  }

  return items;
}