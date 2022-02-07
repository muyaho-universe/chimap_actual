import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late int type;
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
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 27, 15, 40),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 12.5),
            Container(
              width: 300.0,
              height: 125.0,
              child: Text(
                '가입하고자 하는 유형을       선택해 주세요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Gosan",
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 12.5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300.0,
                  height: 125.0,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(width: 2.5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                '정보확인',
                                style: TextStyle(
                                  fontFamily: "Gosan",
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                    children: <Widget>[
                                      Text('보호자가 맞으신가요?'),
                                      Text('맞으시면 "예"를 눌러주세요'),
                                    ]
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('아니오'),
                                ),
                                TextButton(
                                  onPressed: (){
                                    type = 1;
                                    Get.toNamed("/first/login/signup/partner1", arguments: type);
                                  },
                                  child: Text('예'),
                                ),
                              ],
                            );
                          }
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'asset/images/partner.png',
                          width: 90,
                          height: 90,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            '보호자',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 28.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: 300.0,
                  height: 125.0,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(width: 2.5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                '정보확인',
                                style: TextStyle(
                                  fontFamily: "Gosan",
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                    children: <Widget>[
                                      Text('대상자가 맞으신가요?'),
                                      Text('맞으시면 "예"를 눌러주세요'),
                                    ]
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('아니오'),
                                ),
                                TextButton(
                                  onPressed: (){
                                    type = 2;
                                    Get.toNamed("/first/login/signup/partner1", arguments: type);
                                  },
                                  child: Text('예'),
                                ),
                              ],
                            );
                          }
                      ); //ShowDialog
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'asset/images/elder.png',
                          width: 90,
                          height: 90,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            '대상자',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 28.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: 300.0,
                  height: 125.0,
                  child: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(width: 2.5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                '정보확인',
                                style: TextStyle(
                                  fontFamily: "Gosan",
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                    children: <Widget>[
                                      Text('일반인이 맞으신가요?'),
                                      Text('맞으시면 "예"를 눌러주세요'),
                                    ]
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('아니오'),
                                ),
                                TextButton(
                                  onPressed: (){
                                    type = 3;
                                    Get.toNamed("/first/login/signup/partner1", arguments: type);
                                  },
                                  child: Text('예'),
                                ),
                              ],
                            );
                          }
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'asset/images/girl.png',
                          width: 90,
                          height: 90,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            '일반인',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 28.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}