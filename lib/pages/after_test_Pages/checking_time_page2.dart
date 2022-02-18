import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeSettingPage2 extends StatefulWidget {
  TimeSettingPage2({Key? key}) : super(key: key);

  @override
  _TimeSettingPage2 createState() => _TimeSettingPage2();
}

class _TimeSettingPage2 extends State<TimeSettingPage2> {
  final _signUpFormKey = GlobalKey<FormState>();

  DateTime dateTime1 = DateTime.now().add(const Duration(days: 7));

  var time = Get.arguments;

  String hourText() {
    if (time == null) {
      return '시간을 선택해 주세요!';
    } else {
      final hours;
      final minutes;
      if (time.hour >= 13) {
        hours = (time.hour - 12).toString().padLeft(2, '0');
        minutes = time.minute.toString().padLeft(2, '0');
        return '오후 $hours시 $minutes분';
      } else if (time.hour == 12) {
        hours = time.hour.toString().padLeft(2, '0');
        minutes = time.minute.toString().padLeft(2, '0');
        return '오후 $hours시 $minutes분';
      } else {
        hours = time.hour.toString().padLeft(2, '0');
        minutes = time.minute.toString().padLeft(2, '0');
        return '오전 $hours시 $minutes분';
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
                    '일주일 뒤인\n',
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${DateFormat('yyyy').format(dateTime1)}.${dateTime1.month}.${dateTime1.day} ' +
                            hourText() +
                            '\n',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Color(0xFF6A74CF),
                        ),
                      ),
                      Text(
                        ' 에\n',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '데이터 수집이 완료 됩니다! \n\n7일 뒤에 다시 접속해 주세요',
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              primary: Color(0xFFFFBD9D),
            ),
            onPressed: () {
              Get.toNamed('/onGatheringPage');
            },
            child: Text('임시'),
          )
        ],
      ),
    );
  }
}
