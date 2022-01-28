import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PartnerSignUpPage2 extends StatefulWidget {
  PartnerSignUpPage2({Key? key}) : super(key: key);

  @override
  _PartnerSignUpPage2State createState() => _PartnerSignUpPage2State();
}

class _PartnerSignUpPage2State extends State<PartnerSignUpPage2> {
  final _signUpFormKey = GlobalKey<FormState>();

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('보호자 회원가입'),
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
                    "생년월일을 입력해주세요",
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "본인 인증을 위해 필요합니다.",
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
                        width: 150,
                        height: 60,
                        child: Text(
                          '${DateFormat('yyyy').format(_selectedDate)}.${_selectedDate.month}.${_selectedDate.day}',
                          style: TextStyle(
                            fontFamily: "Gosan",
                            fontSize: 28.0,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: Color(0xEBFFBD9D),
                    ),
                    child: Container(
                      width: 175,
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'asset/images/calenderIcon.png',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          const Text(
                            '날짜선택',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 28.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Future<DateTime?> future = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        // builder: (BuildContext context, Widget child){
                        //   return Theme(
                        //       data: ThemeData.light(),
                        //       child: child
                        //   );
                        // }
                      );

                      future.then((date) {
                        setState(() {
                          _selectedDate = date!.add(const Duration(hours: 9));
                        });
                      });
                    },
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: Color(0xFFC4C4C4),
                  ),
                  onPressed: () {
                    Get.offNamed('/first/login/signup/partner1');
                  },
                  child: const Text(
                    '이전',
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontSize: 28.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
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
                              '생년월일이 맞으신가요?',
                              style: TextStyle(
                                fontFamily: "Gosan",
                                fontSize: 24.0,
                                color: Colors.black,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(children: <Widget>[
                                Text(
                                  '생년월일: ${DateFormat('yyyy').format(_selectedDate)}.${_selectedDate.month}.${_selectedDate.day}',
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
                                  Get.offNamed("/first/login/signup/partner3");
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
