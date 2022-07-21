import 'dart:math';

import 'package:chimap_actual/utils/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:chimap_actual/utils/user_info.dart';

class PageViweSignUpPage extends StatefulWidget {
  const PageViweSignUpPage({Key? key}) : super(key: key);

  @override
  _PageViweSignUpPageState createState() => _PageViweSignUpPageState();
}

class _PageViweSignUpPageState extends State<PageViweSignUpPage> {
  final _signUpFormKey = GlobalKey<FormState>();
  final signUpController = Get.put(SignUpController());

  final TextEditingController _signUpUserNameController =
      TextEditingController();
  final TextEditingController _signUpUserPhoneNumController =
      TextEditingController();
  final PageController controller = PageController(
    initialPage: 0,
  );

  DateTime _selectedDate = DateTime.now();
  String name = "";
  int currentPage = 0;
  String phoneNum = "";
  UInfo uInfo = Get.arguments;
  bool _isNameEmpty = true;
  bool _isPhoneNumEmpty = true;
  late QuerySnapshot querySnapshot;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '회원가입',
              style: TextStyle(
                fontFamily: "Gosan",
                fontSize: 28.0,
                color: Colors.black87,
              ),
            ),
            backgroundColor: const Color(0xFFFFCAB0),
            centerTitle: true, // 중앙 정렬
            elevation: 0.0,
          ),
          //backgroundColor: Colors.white,
          body: _bodyWidget(),
        ),
      ),
    );
  }

  _bodyWidget() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      onPageChanged: (page) {
        setState(() {});
      },
      children: [
        Padding(
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
                          onChanged: (value) {
                            setState(() {
                              _isNameEmpty = false;
                              name = _signUpUserNameController.text;
                            });
                          },
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
                        primary: _isNameEmpty? Color(0xFFC4C4C4) : Color(0xFFFFBD9D),
                      ),
                      onPressed: _isNameEmpty
                          ? null
                          : () {
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
                                          Row(
                                            children: [
                                              Text(
                                                '성함: ',
                                                style: TextStyle(
                                                  fontFamily: "Gosan",
                                                  fontSize: 18.0,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              Text(
                                                '$name',
                                                style: TextStyle(
                                                  fontFamily: "Gosan",
                                                  fontSize: 18.0,
                                                  color: Color(0xFF6A74CF),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
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
                                          onPressed: () async {
                                            uInfo.setUserName(name);
                                            currentPage++;
                                            controller.jumpToPage(currentPage);
                                            Navigator.of(context).pop();
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
        ),
        // 1번째 페이지
        Padding(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 170,
                                height: 60,
                                child: Text(
                                  '${DateFormat('yyyy').format(_selectedDate)}.${_selectedDate.month}.${_selectedDate.day}',
                                  style: TextStyle(
                                    fontFamily: "Gosan",
                                    fontSize: 30.0,
                                    color: Color(0xFF6A74CF),
                                  ),
                                ),
                              ),
                            ],
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
                          );

                          future.then((date) {
                            setState(() {
                              _selectedDate =
                                  date!.add(const Duration(hours: 9));
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
                        currentPage--;
                        controller.jumpToPage(currentPage);
                        Navigator.of(context).pop();
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
                                    Row(
                                      children: [
                                        Text(
                                          '생년월일: ',
                                          style: TextStyle(
                                            fontFamily: "Gosan",
                                            fontSize: 18.0,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Text(
                                          '${DateFormat('yyyy').format(_selectedDate)}.${_selectedDate.month}.${_selectedDate.day}',
                                          style: TextStyle(
                                            fontFamily: "Gosan",
                                            fontSize: 18.0,
                                            color: Color(0xFF6A74CF),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
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
                                      uInfo.setBirthdy(_selectedDate);
                                      currentPage++;
                                      controller.jumpToPage(currentPage);
                                      Navigator.of(context).pop();
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
        ),
        // 2번째 페이지
        Padding(
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
                        "휴대폰 번호를 입력해주세요",
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
                          controller: _signUpUserPhoneNumController,

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '-를 빼고 번호만 입력해주세요.',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _isPhoneNumEmpty = false;
                              phoneNum = _signUpUserPhoneNumController.text;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 15.0),
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
                        currentPage--;
                        controller.jumpToPage(currentPage);
                        Navigator.of(context).pop();
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
                        primary: _isPhoneNumEmpty? Color(0xFFC4C4C4) : Color(0xFFFFBD9D),
                      ),
                      onPressed: _isPhoneNumEmpty? null:() {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    '전화번호가 맞으신가요?',
                                    style: TextStyle(
                                      fontFamily: "Gosan",
                                      fontSize: 24.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(children: <Widget>[
                                      Row(
                                        children: [
                                          Text(
                                            '전화번호: ',
                                            style: TextStyle(
                                              fontFamily: "Gosan",
                                              fontSize: 18.0,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Text(
                                            '$phoneNum',
                                            style: TextStyle(
                                              fontFamily: "Gosan",
                                              fontSize: 18.0,
                                              color: Color(0xFF6A74CF),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
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
                                        uInfo.setPhoneNumber(phoneNum);
                                        currentPage++;
                                        controller.jumpToPage(currentPage);
                                        Navigator.of(context).pop();
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
        ),
        // 3번째 페이지
        Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '입력하신 정보가 맞으신가요?',
                style: TextStyle(
                  fontFamily: 'Gosan',
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '$name',
                style: TextStyle(
                  fontFamily: 'Gosan',
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '${DateFormat('yyyy').format(_selectedDate)}.${_selectedDate.month}.${_selectedDate.day}',
                style: TextStyle(
                  fontFamily: 'Gosan',
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '$phoneNum',
                style: TextStyle(
                  fontFamily: 'Gosan',
                  fontSize: 24.0,
                ),
              ),
              SizedBox(height: 175.0),
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
                        currentPage--;
                        controller.jumpToPage(currentPage);
                        Navigator.of(context).pop();
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
                            // UInfo(name, _selectedDate, phoneNum, type);
                        Get.offNamed("/first/login/signup/numberAuth",
                            arguments: uInfo);
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
      ],
    );
  }
}

class SignUpController extends GetxController {
  var isRegistering = false.obs;

  registering() {
    isRegistering.value = true;
    update();
  }
}
