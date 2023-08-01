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
  final isSelected = [false,false,false,false,false,false,false];
  var textColor = [0xff828181,0xff828181,0xff828181,0xff828181,0xff828181,0xff828181,0xff828181];
  var buttonColor = [0xffEEEEEE,0xffEEEEEE,0xffEEEEEE,0xffEEEEEE,0xffEEEEEE,0xffEEEEEE,0xffEEEEEE,];
  var borderColor = [0xffEEEEEE,0xffEEEEEE,0xffEEEEEE,0xffEEEEEE,0xffEEEEEE,0xffEEEEEE,0xffEEEEEE,];
  var _date = ["월","화","수","목","금","토","일"];
  var selectedDate = 0;
  var _itemCounter = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black
        ),
        title:  const Text(
          "알바정보 등록",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffFAFAFA),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Flexible(
                  child: Text("알바명",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  fit: FlexFit.tight,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: TextField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "ex.옥수학학원",
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Flexible(
                  child: Text("시급",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  fit: FlexFit.tight,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: TextField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "ex.10000",
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
            SizedBox(
              height: 15,
            ),
            Text("근무시간",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
            SizedBox(
              height: 10,
            ),

            ToggleButtons(
              renderBorder: false,
              borderWidth: 0,
              fillColor: Color(0xffFAFAFA),
              splashColor: Color(0xffFAFAFA),
              focusColor: Color(0xffFAFAFA),
              hoverColor: Color(0xffFAFAFA),

              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(buttonColor[0]),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(borderColor[0])
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("월",
                    style: TextStyle(
                      color: Color(textColor[0]),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(buttonColor[1]),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(borderColor[1])
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("화",
                    style: TextStyle(
                      color: Color(textColor[1]),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(buttonColor[2]),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(borderColor[2])
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("수",
                    style: TextStyle(
                      color: Color(textColor[2]),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(buttonColor[3]),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(borderColor[3])
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("목",
                    style: TextStyle(
                      color: Color(textColor[3]),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(buttonColor[4]),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(borderColor[4])
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("금",
                    style: TextStyle(
                      color: Color(textColor[4]),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(buttonColor[5]),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(borderColor[5])
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("토",
                    style: TextStyle(
                      color: Color(textColor[5]),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(buttonColor[6]),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Color(borderColor[6])
                    ),
                  ),
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("일",
                    style: TextStyle(
                      color: Color(textColor[6]),
                    ),
                  ),
                ),
              ],
              isSelected: isSelected,
              onPressed: daySelect,
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: _itemCounter!=0,
              child: Row(
                children: [
                  Flexible(
                      fit:FlexFit.tight,
                      child: SizedBox()
                  ),
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
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _itemCounter,
                  itemBuilder: (BuildContext context, int index){

                    return Container(

                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(_date[selectedDate],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextField(
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "00:00",
                                  hintStyle: TextStyle(
                                    color: Color(0xff828181),
                                    fontSize: 15,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffEEEEEE),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextField(
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: "00:00",
                                  hintStyle: TextStyle(
                                    color: Color(0xff828181),
                                    fontSize: 15,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffEEEEEE),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }
              ),
            ),

          ],
        ),
      ),


    );
  }


  void daySelect(value){
    selectedDate = value;

    if(isSelected[value]==false){
      isSelected[value]=true;
      buttonColor[value] = 0xffFFFFFF;
      textColor[value] = 0xffA1A8D6;
      borderColor[value] = 0xffA1A8D6;
      _itemCounter+=1;
    }
    else{
      isSelected[value]=false;
      buttonColor[value] = 0xffEEEEEE;
      textColor[value] = 0xff828181;
      borderColor[value] = 0xffEEEEEE;
      _itemCounter-=1;
    }
    setState(() {
    });
  }
}