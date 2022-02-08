import 'package:chimap_actual/utils/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class NumberAuthPage extends StatefulWidget {
  const NumberAuthPage({Key? key}) : super(key: key);

  @override
  _NumberAuthPageState createState() => _NumberAuthPageState();
}

class _NumberAuthPageState extends State<NumberAuthPage> {
  final _AuthFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  final SmsAutoFill _autoFill = SmsAutoFill();
  var type = Get.arguments;

  String _number = '010-4208-2214';

  final TextEditingController _authNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('본인인증'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Form(
        key: _AuthFormKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  '인증번호를',
                  style: TextStyle(
                    fontFamily: 'Gosan',
                    fontSize: 24.0,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '$_number',
                      style: TextStyle(
                        fontFamily: 'Gosan',
                        fontSize: 24.0,
                        color: Color(0xFF6A74CF),
                      ),
                    ),
                    Text(
                      '로',
                      style: TextStyle(
                        fontFamily: 'Gosan',
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '전송할게요.',
                  style: TextStyle(
                    fontFamily: 'Gosan',
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '아래 버튼을 눌러주세요.',
                  style: TextStyle(
                    fontFamily: 'Gosan',
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
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
                            '중요!',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 24.0,
                              color: Colors.black,
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(children: <Widget>[
                              Text(
                                '문자로 발송된 인증번호를 입력하고 아래 인증하기 버튼을 눌러주세요!',
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
                      },
                    );
                  },
                  child: const Text(
                    '인증번호 받기',
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontSize: 28.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: 300,
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _authNumberController,
                    decoration: InputDecoration(
                      hintText: '문자로 받은 인증번호를 입력해주세요.',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                OutlinedButton(
                  onPressed: () async {
                    if (type == 100) {
                      Get.offNamed("/first/login/findingIDinfo");
                    } else if (type == 101) {
                      Get.offNamed("/first/login/resetPW");
                    } else
                      Get.offNamed("first/login/signup/IDandPW",
                          arguments: type);
                  },
                  child: Text('인증하기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// void verifyPhoneNumber() async {
//
// }
