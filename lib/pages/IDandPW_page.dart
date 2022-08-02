import 'package:chimap_actual/utils/user_controller.dart';
import 'package:chimap_actual/utils/user_info.dart';
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
  UInfo info = Get.arguments;

  late String address = info.address;
  bool go = true;
  late Reference firebaseStorageRef;
  late var mapUrl =
      'http://www.juso.go.kr/addrlink/addrLinkApi.do?confirmKey=devU01TX0FVVEgyMDIyMDIwNzE2NDk0NzExMjIxNDk=';
  var result;
  late String id;
  String _message = "";
  String _passwordLength = "";
  String _passwordCheck = "";
  String firstPassword = "";
  String secondPassword = "";

  bool _longPassword = false;

  CollectionReference database = FirebaseFirestore.instance.collection('user');
  late QuerySnapshot querySnapshot;

  bool _isIDEmpty = true;
  int _isIDCheked = 0;
  bool _passwordChecked = false;

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
                  '',
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
                      '아이디: ',
                      style: TextStyle(
                        fontFamily: "Gosan",
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      _message,
                      style: TextStyle(
                        fontFamily: "Gosan",
                        fontSize: 20.0,
                        color: _message == "존재합니다"
                            ? Colors.redAccent
                            : Colors.green,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 60,
                      child: TextFormField(
                        // controller: _signUpIDController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '아이디를 입력해주세요.',
                        ),

                        onChanged: (value) {
                          setState(() {
                            _isIDEmpty = false;
                            id = value as String;
                            info.setID(id);
                          });
                        },
                        initialValue: info.id,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 90,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () async {
                          int i;
                          querySnapshot = await database.get();
                          String _temp = "";
                          for (i = 0; i < querySnapshot.docs.length; i++) {
                            var a = querySnapshot.docs[i];
                            if (a.get('uid') == info.id) {
                              _isIDCheked = 1;
                              _temp = "존재합니다";
                              print("존재합니다");
                              info.setIdCheck(false);
                              break;
                            }
                            _temp = "사용가능합니다.";
                            _isIDCheked = 2;
                            info.setIdCheck(true);
                          }

                          setState(() {
                            _message = _temp;
                          });
                        },
                        child: Text(
                          "중복검사",
                          style: TextStyle(
                            fontFamily: "Gosan",
                            fontSize: 14.5,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                    Text(
                      _passwordLength,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '비밀번호를 입력해주세요.',
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (!value.isEmpty) {
                          if (value.length < 6) {
                            _passwordLength = "여섯 글자 이상 적어주세요!";
                            _longPassword = false;
                          } else {
                            _longPassword = true;
                            firstPassword = value as String;
                            _passwordLength = "사용할 수 있습니다.";
                            if (!firstPassword.isEmpty) {
                              if (value == secondPassword) {
                                _passwordCheck = "비밀번호가 일치합니다!";
                                info.setPassword(firstPassword);
                              } else {
                                _passwordCheck = "비밀번호가 일치하지 않습니다.";
                              }
                            }
                          }
                        } else {
                          _passwordCheck = "";
                          _passwordLength = "";
                          _longPassword = false;
                        }
                      });
                    },
                    initialValue: info.password,
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
                      '비밀번호 확인: ',
                      style: TextStyle(
                        fontFamily: "Gosan",
                        fontSize: 20.0,
                        color: Colors.black87,
                      ),
                    ),
                    Container(
                      height: 20,
                      child: Text(
                        _passwordCheck,
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: 15.0,
                          color: _passwordCheck == "비밀번호가 일치하지 않습니다."
                              ? Colors.redAccent
                              : Colors.green,
                        ),
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '비밀번호를 다시 한번 입력해주세요.',
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (!value.isEmpty) {
                          if (value == firstPassword) {
                            _passwordCheck = "비밀번호가 일치합니다!";
                            info.setPassword(firstPassword);
                          } else {
                            _passwordCheck = "비밀번호가 일치하지 않습니다.";
                          }
                        } else {
                          _passwordCheck = "";
                        }
                      });
                    },
                    readOnly: _longPassword ? false : true,
                    initialValue: info.password,
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
                Text("$address"),
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
                    Get.toNamed('/first/login/locationSearch', arguments: info);
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
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                          CollectionReference user =
                          FirebaseFirestore.instance.collection('user');


                          user.add({
                            //Mail(
                            'id': info.id,
                            'password': info.password,
                            'name': info.userName,
                            'phone': info.userPhoneNum,
                            'birthday': info.birthDay,
                            'gender': info.gender,
                            'address': info.address,
                            'auth': info.auth,
                            'type': info.userType,
                          });
                          // if (info.userType == 1) {
                          //   Get.offNamed('/first/login/signup/partnerOnly');
                          // } else {
                            Get.offNamed("/first/login/signup/complete");
                          // }
                        },
                        child: const Text(
                          '회원 가입하기',
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
