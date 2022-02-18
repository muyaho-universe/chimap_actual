import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeSettingPage1 extends StatefulWidget {
  TimeSettingPage1({Key? key}) : super(key: key);

  @override
  _TimeSettingPage1 createState() => _TimeSettingPage1();
}

class _TimeSettingPage1 extends State<TimeSettingPage1> {
  final _signUpFormKey = GlobalKey<FormState>();

  TimeOfDay time = TimeOfDay.now();


  Future pickTime(BuildContext context ) async {
    final initialTime = TimeOfDay.now();
    final newTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (newTime == null ) return ;
    setState(() => time = newTime);
  }

  String getText(){
    if(time == null ) {
      return '시간을 선택해 주세요!';
    }
    else{
      final hours;
      final minutes;
      if(time.hour>=13){
        hours = (time.hour-12).toString().padLeft(2,'0');
        minutes = time.minute.toString().padLeft(2,'0');
        return'오후 $hours시 $minutes분';
      }
      else if(time.hour==12){
        hours = time.hour.toString().padLeft(2,'0');
        minutes = time.minute.toString().padLeft(2,'0');
        return'오후 $hours시 $minutes분';
      }
      else{
        hours = time.hour.toString().padLeft(2,'0');
        minutes = time.minute.toString().padLeft(2,'0');
        return'오전 $hours시 $minutes분';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('시간 설정 '),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 25.0),
          Container(
            width: 310,
            height: 457,
            child: Form(
              key: _signUpFormKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 140.0,
                  ),
                  Text(
                    "시간을 입력해주세요",
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "최종검사를 실행하는 시간입니다 .",
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontSize: 20.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: 45.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 60,
                        child: Text(
                          getText() ,
                          style: TextStyle(
                            fontFamily: "Gosan",
                            fontSize: 28.0,
                            color: Color(0xFF6A74CF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Color(0xEBFFBD9D),
                    ),
                    icon: Icon(Icons.alarm),
                    label: Container(
                      color: Color(0xEBFFBD9D),
                      width: 175,
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          const Text(
                            '시간 선택',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 28.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () => pickTime(context),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 131.0,
                height: 31.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: Color(0xFFFFBD9D),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              '선택한 시간이 맞으신가요?',
                              style: TextStyle(
                                fontFamily: "Gosan",
                                fontSize: 24.0,
                                color: Colors.black,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(children: <Widget>[
                                Text(
                                  getText(),
                                  style: TextStyle(
                                    fontFamily: "Gosan",
                                    fontSize: 18.0,
                                    color:Color(0xFF6A74CF),
                                  ),
                                ),
                                SizedBox(height: 15.0,),
                                Text(
                                  '맞으시면 "예"를 눌러주세요',
                                  style: TextStyle(
                                    fontFamily: "Gosan",
                                    fontSize: 18.0,
                                    color: Colors.black87,
                                  ),
                                ),
                              ]),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('아니오'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.offNamed('/first/login/timesetPage2', arguments: time);
                                },
                                child: Text('예'),
                              ),
                            ],
                          );
                        }); //ShowDialog
                  },
                  child: const Text(
                    '다음',
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontSize: 28.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}