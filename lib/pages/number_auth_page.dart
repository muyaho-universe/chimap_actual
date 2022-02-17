import 'package:chimap_actual/utils/user_controller.dart';
import 'package:chimap_actual/utils/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';


class NumberAuthPage extends StatefulWidget {
  const NumberAuthPage({Key? key}) : super(key: key);

  @override
  _NumberAuthPageState createState() => _NumberAuthPageState();
}

class _NumberAuthPageState extends State<NumberAuthPage> {


  final _AuthFormKey = GlobalKey<FormState>();
  // final userController = Get.put(UserController());
  final SmsAutoFill _autoFill = SmsAutoFill();

  UInfo _info = Get.arguments;

  late var _number = _info.userPhoneNum;

  final TextEditingController _authNumberController = TextEditingController();

  final FocusNode otpFocusNode = FocusNode();

  bool authOk = false; //- 폰인증이 정상적으로 완료됐는지 안됐는지 여부
  bool requestedAuth =
      false; //- 폰인증 요청을 보냈는지 여부. 인증 코드(OTP 6자리) 를 칠 수 있는 컨테이너의 visible 결정
  String? verificationId; //-폰인증 시 생성되는 값
  bool showLoading = false; //폰인증 보낼 때와 로그인할 때 완료될 때까지 뺑뺑이 화면 보일 수 있도록 하는 장치
  String? smsOTP;
  String errorMessage = '';

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber() async {
      await _auth.verifyPhoneNumber(
          phoneNumber: '+821000000000',
          verificationCompleted: (phoneAuthCredential) async{
            print("otp 문자옴");
          },
          codeSent: (verificationId, resendingToken){
            print('코드발송');
          },
          // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          verificationFailed: (verificationFailed) {
            print(verificationFailed.code);
            print('fail');
          });
  }

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
    return SingleChildScrollView(
      child: Padding(
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
                                onPressed: () async {
                                  verifyPhoneNumber();
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
                    },
                    child: Text('인증하기'),
                  ),
                  SizedBox(
                    height: 100,
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
                        if (_info.userType == 100) {
                          Get.offNamed("/first/login/findingIDinfo");
                        } else if (_info.userType == 101) {
                          Get.offNamed("/first/login/resetPW");
                        } else {
                          Get.offNamed("first/login/signup/IDandPW",
                              arguments: _info.userType);
                        } //ShowDialog
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
    );
  }
}
