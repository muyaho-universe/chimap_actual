import 'package:chimap_actual/utils/user_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

enum Option { MALE, FEMALE }

class IDandPWPage extends StatefulWidget {
  const IDandPWPage({Key? key}) : super(key: key);

  @override
  _IDandPWPageState createState() => _IDandPWPageState();
}

class _IDandPWPageState extends State<IDandPWPage> {
  final _IPsignUpFormKey = GlobalKey<FormState>();
  final userLoginController = Get.put(UserLoginController());

  final TextEditingController _signUpIDController = TextEditingController();
  final TextEditingController _signUpPWController = TextEditingController();
  final TextEditingController _signUpPWConfirmController =
      TextEditingController();
  var type = Get.arguments;
  bool go = true;
  late Reference firebaseStorageRef;
  late var mapUrl =
      'http://www.juso.go.kr/addrlink/addrLinkApi.do?confirmKey=devU01TX0FVVEgyMDIyMDIwNzE2NDk0NzExMjIxNDk=';
  late CollectionReference database;
  var result;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('아이디와 비밀번호'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    List<bool> isSelected = List.generate(2, (index) => false);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _IPsignUpFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 75,
                ),
                Text(
                  '로그인에 사용할 아이디와',
                  style: TextStyle(
                    fontFamily: "Gosan",
                    fontSize: 25.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '비밀번호를 적어주세요!',
                  style: TextStyle(
                    fontFamily: "Gosan",
                    fontSize: 25.0,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '무야호',
                  style: TextStyle(
                    fontFamily: "Gosan",
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 38,
                    ),
                    Text(
                      '아이디:',
                      style: TextStyle(
                        fontFamily: "Gosan",
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    controller: _signUpIDController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '아이디를 입력해주세요.',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 38,
                    ),
                    Text(
                      '비밀번호:',
                      style: TextStyle(
                        fontFamily: "Gosan",
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    controller: _signUpPWController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '비밀번호를 입력해주세요.',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 38,
                    ),
                    Text(
                      '비밀번호 확인:',
                      style: TextStyle(
                        fontFamily: "Gosan",
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    controller: _signUpPWConfirmController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '비밀번호를 다시 한번 입력해주세요.',
                    ),
                    validator: (value) {
                      if (value!.trim() != _signUpPWController.text) {
                        return '비밀번호가 다릅니다.';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 38,
                    ),
                    Text(
                      '성별',
                      style: TextStyle(
                        fontFamily: "Gosan",
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: Option.MALE,
                            groupValue: userLoginController.option.value,
                            onChanged: (value) {
                              userLoginController.option.value =
                                  value as Option;
                            },
                          ),
                          Text(
                            '남자',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 20.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: Option.FEMALE,
                            groupValue: userLoginController.option.value,
                            onChanged: (value) {
                              userLoginController.option.value =
                                  value as Option;
                            },
                          ),
                          Text(
                            '여자',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 20.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 38,
                    ),
                    Text(
                      '주소',
                      style: TextStyle(
                        fontFamily: "Gosan",
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("$type"),

                ElevatedButton(
                  child: Text(
                    '우편주소검색',
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontSize: 14.0,
                      color: Colors.black87,
                    ),
                  ),
                  onPressed: () async {
                    Get.toNamed('/first/login/locationSearch');

                  },
                ),

                SizedBox(
                  height: 15,
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
                          '처음으로',
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
                          if (_signUpPWController.text ==
                              _signUpPWConfirmController.text) {
                            if (type == 1) {
                              Get.offNamed('/first/login/signup/partnerOnly');
                            } else {
                              Get.offNamed("/first/login/signup/complete");
                            }
                          } else {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      '비밀번호가 다릅니다!',
                                      style: TextStyle(
                                        fontFamily: "Gosan",
                                        fontSize: 24.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    content: SingleChildScrollView(
                                      child: ListBody(children: <Widget>[
                                        Text(
                                          '비밀번호를 다시 확인해주세요!',
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
                                        child: Text('예'),
                                      ),
                                    ],
                                  );
                                });
                          }
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
          ),
        ),
      ),
    );
  }
}

class UserLoginController extends GetxController {
  var visibility = false.obs;
  var isLoging = false.obs;
  var option = Option.MALE.obs;

  visible() {
    visibility.value ? visibility.value = false : visibility.value = true;
    update();
  }

  loging() {
    isLoging.value = true;
    update();
  }

  notLoging() {
    isLoging.value = false;
    update();
  }
}
