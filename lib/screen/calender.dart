import "package:flutter/material.dart";
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


  @override
  Widget build(BuildContext context){
    String userName = widget.userName;

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
              )

            ),

            onDaySelected: (DateTime selectedDay, DateTime focusedDay){

              addForm(selectedDay);
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



  void addForm(DateTime date){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("$date"),
          );
        }
    );
  }
}