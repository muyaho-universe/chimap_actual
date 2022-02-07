import 'dart:ffi';

import 'package:chimap_actual/utils/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chimap_actual/utils/user_model.dart';

class PartnerSignUpPage1 extends StatefulWidget {
  PartnerSignUpPage1({Key? key}) : super(key: key);


  @override
  _PartnerSignUpPage1State createState() => _PartnerSignUpPage1State();
}

class _PartnerSignUpPage1State extends State<PartnerSignUpPage1> {

  final _signUpFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  String? InputUserName;
  UserModel userModel = UserModel();
  var type = Get.arguments;

  final TextEditingController _signUpUserNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('회원가입'),
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
                children: [
                  SizedBox(
                    height: 140.0,
                  ),
                  Text(
                    "이름을 입력해주세요",
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
                  Container(
                    width: 300,
                    height: 60,
                    child: TextFormField(
                      controller: _signUpUserNameController,
                      decoration: InputDecoration(
                        hintText: '이름을 입력해주세요.',
                      ),
                    ),
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
                    Get.offNamed("/first/signup");
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
              SizedBox(width: 10,),
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
                    InputUserName = _signUpUserNameController.text;
                    //userModel.userName = InputUserName;
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              '이름이 맞으신가요?',
                              style: TextStyle(
                                fontFamily: "Gosan",
                                fontSize: 24.0,
                                color: Colors.black,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(children: <Widget>[
                                Text(
                                  '성함: $InputUserName',
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
                                  Get.offNamed("/first/login/signup/partner2", arguments: type);
                                },
                                child: Text('예'),
                              ),
                            ],
                          );
                        });


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