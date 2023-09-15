import "package:flutter/material.dart";
import 'package:ok_client/controller/JobInfoController.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalenderPage extends StatefulWidget{
  final String userName;
  const CalenderPage({Key? key, required this.userName}): super(key:key);

  @override
  CalenderState createState() => CalenderState();
}

class CalenderState extends State<CalenderPage>{
  DateTime? selectedDay;

  Map<DateTime, List<Event>> events = {
    DateTime.utc(2023,8,13) : [ Event('title'), Event('title2') ],
    DateTime.utc(2023,8,14) : [ Event('title3') ],
  };

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }






  @override
  Widget build(BuildContext context) {
    String userName = widget.userName;

    Future<List<dynamic>> nameList = show_names(userName);
    List<dynamic> names=["null"];
    void FutureToList(Future<List<dynamic>> nameList) async{
      names = await nameList;
    }
    FutureToList(nameList);



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
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023, 6, 01),
            lastDay: DateTime.utc(2030, 9, 31),
            focusedDay: DateTime.now(),
            locale: 'ko-KR',
            daysOfWeekHeight: 30,

            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),

            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                //color: Colors.black,
                border: Border.all(
                  color: Color(0xffA1A8D6),
                  width: 1.0,
                ),
                shape: BoxShape.circle,


              ),
              selectedTextStyle: TextStyle(
                color: Color(0xffA1A8D6),
              ),


            ),
            eventLoader: _getEventsForDay,

            onDaySelected: (DateTime selectedDay, DateTime focusedDay){

              addForm(selectedDay, names);
              setState(() {
                this.selectedDay = selectedDay;
              });
            },

            selectedDayPredicate: (DateTime date){
              if(selectedDay == null){
                return false;
              }
              return date.year == selectedDay!.year &&
                  date.month == selectedDay!.month &&
                  date.day == selectedDay!.day;
            },

            calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day){
                  //if(day.weekday == 7) return Center(child: Text('Sun',style: TextStyle(color: Colors.red),),);

                }
            ),
          ),
        ],
      ),

    );
  }



  void addForm(DateTime date, List<dynamic> nameList) {

    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Column(
              children: <Widget>[
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffEEF0FF),
                    ),
                    child: Icon(Icons.add,
                      color: Color(0xffA1A8D6),
                    )
                ),
                Text("알바기록 추가",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            content: Column(
              children: [
                Text(
                  "${date}",
                  style: TextStyle(
                    fontSize: 13,

                  ),),
                DropdownButton(
                    value: nameList[0],
                    items: nameList.map((item)=>
                        DropdownMenuItem(
                            value: item,
                            child: Text(item)
                        )).toList(),
                    onChanged: (value){

                    }
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text("시작시간",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Text("종료시간",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "00:00:00",
                                  hintStyle: TextStyle(
                                    color: Color(0xff828181),
                                    fontSize: 15,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffEEEEEE),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Text("...",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff828181)
                              ),),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "00:00:00",
                                  hintStyle: TextStyle(
                                    color: Color(0xff828181),
                                    fontSize: 15,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffEEEEEE),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )


              ],
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    events[date] = [ Event('title3') ];
                    setState(() {
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffA1A8D6),
                    //alignment: Alignment.center,
                    //padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 18),
                  ),
                  child: Text("추가정보를 등록하세요",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}

class Event {
  String title;

  Event(this.title);
}