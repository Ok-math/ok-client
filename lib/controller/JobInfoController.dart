import 'package:http/http.dart' as http;
import 'package:ok_client/requestbody/JobInfoRequestBody.dart';
import 'dart:async';
import 'dart:convert';
import 'package:ok_client/responsebody/JobInfoResponseBody.dart';

var URL = 'http://172.30.1.34:8080';

Future<JobInfoResponseBody> Jobinfo_save(JobInfoRequestBody requestBody) async{
  var responseBody = JobInfoResponseBody(id: 0, name: "0", result: true);
  var response = await http.post(
    //안드로이드 기기에서 작동시 localhost 대신 무선LAN IPv4값으로 수정
    Uri.parse('http://localhost:8080/jobinfo/save'),
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

Future<List<String>> show_names(String userId)async{
  List<String> nameList = [];

  Map<String,String> params={
    "id":userId
  };

  var url = Uri.http('http://localhost:8080','/jobinfo/name',params);


  var response = await http.get(
    //안드로이드 기기에서 작동시 localhost 대신 무선LAN IPv4값으로 수정
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    },
  );


  if(response.statusCode == 200){
    print("ok200");
    nameList = jsonDecode(response.body);
    print(nameList);
    return nameList;
  }
  else{
    return nameList;
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