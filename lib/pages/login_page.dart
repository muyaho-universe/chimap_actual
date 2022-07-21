import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chimap_actual/auth/authentication.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final phoneNumber = Get.arguments;
  final _loginFormKey = GlobalKey<FormState>();

  final loginController = Get.put(LoginController());

  final TextEditingController _loginIDController = TextEditingController();
  final TextEditingController _loginPWController = TextEditingController();

  CollectionReference database = FirebaseFirestore.instance.collection('user');
  late QuerySnapshot querySnapshot;

  var _num = 22.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '치맵',
            style: TextStyle(
              fontFamily: "Gosan",
              fontSize: 28.0,
              color: Colors.black87,
            ),
          ),
          backgroundColor: const Color(0xFFFFCAB0),
          centerTitle: true,
          // 중앙 정렬
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.home), // 햄버거버튼 아이콘 생성
            onPressed: () {
              Get.offAllNamed('/first');
            },
          ),
        ),
        resizeToAvoidBottomInset: false, //키보드 올라와도 안밀리게 해줌
        backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 25.0),
            Form(
              key: _loginFormKey,
              child: Column(children: [
                Text(
                  "로그인",
                  style: TextStyle(
                    fontFamily: "Gosan",
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 55.0),
                Container(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    controller: _loginIDController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: '아이디 입력',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return '아이디를 입력하세요.';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 300,
                  height: 80,
                  child: Obx(
                    () => TextFormField(
                      controller: _loginPWController,
                      obscureText: !loginController.visibility.value,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            loginController.visible();
                          },
                          icon: Icon(
                            loginController.visibility.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        hintText: '비밀번호 입력',
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return '비밀번호를 입력하세요.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 350.0,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Color(0xFFFFBD9D),
                      ),
                      onPressed: () async {
                        if (_loginFormKey.currentState!.validate()) {
                          loginController.loging();
                          _idLogin();
                        }
                      },
                      child: !loginController.isLoging.value
                          ? const Text(
                              '로그인',
                              style: TextStyle(
                                fontFamily: "Gosan",
                                fontSize: 28.0,
                                color: Colors.black87,
                              ),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 66.05),
                Container(
                  width: 220,
                  height: 30,
                  child: Text(
                    '계정을 잊으셨습니까?',
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontSize: _num,
                      color: Colors.black87,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/first/login/accountfound');
                  },
                  child: Text(
                    "계정 찾기",
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontSize: _num,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Color(0xFF6A74CF), //글자색
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      // decoration: TextDecoration.underline,
                    ),
                    alignment: Alignment.topCenter,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '계정이 없으십니까?',
                  style: TextStyle(
                    fontFamily: "Gosan",
                    fontSize: _num,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/first/login/signup');
                  },
                  child: Text(
                    "회원가입",
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontSize: _num,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Color(0xFF6A74CF), //글자색
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    alignment: Alignment.topCenter,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _idLogin() async{


    if (!_loginIDController.text.isEmpty) {
      int i;
      querySnapshot = await database.get();

      for (i = 0; i < querySnapshot.docs.length; i++) {
        var a = querySnapshot.docs[i];

        if (a.get('uid') ==  _loginIDController.text) {
          if(a.get('password') == _loginPWController.text){
            loginController.loging();
            Get.toNamed('/first/login/timesetPage1');
          }
          else{
            loginController.notLoging();
          }
        }
      }

      // if (i == (querySnapshot.docs.length)) {
      //   database.doc(user.uid).set({
      //     'email': user.email.toString(),
      //     'name': user.displayName.toString(),
      //     'uid': user.uid,
      //   });
      // }

        // Get.to();
    }
  }

  Future<void> _emailLogin() async {
    // try {
    //   User? user = await Authentication.signInWithEmailAndPassword(
    //       _loginIDController.text, _loginPWController.text);
    //   if (user != null) {
    //     Get.toNamed('/first/login/timesetPage1');
    //   } else {
    //     loginController.notLoging();
    //   }
    // } catch (e) {
    //   loginController.notLoging();
    //   print('email login failed');
    //   print(e.toString());
    // }
  }
}

class LoginController extends GetxController {
  var visibility = false.obs;
  var isLoging = false.obs;

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
