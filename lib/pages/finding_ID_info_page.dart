import 'package:flutter/material.dart';
import 'package:get/get.dart';

class findingIDInfoPage extends StatefulWidget {
  const findingIDInfoPage({Key? key}) : super(key: key);

  @override
  _findingIDInfoPageState createState() => _findingIDInfoPageState();
}

class _findingIDInfoPageState extends State<findingIDInfoPage> {
  String? _ID = '&&&&&&';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('아이디 정보'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                '***님의 아이디는\n',
                style: TextStyle(
                  fontFamily: "Gosan",
                  fontSize: 28.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '&&&&&\n',
                style: TextStyle(
                  fontFamily: "Gosan",
                  fontSize: 28.0,
                  color: Color(0xFF6A74CF),
                ),
              ),
              Text(
                '입니다.\n',
                style: TextStyle(
                  fontFamily: "Gosan",
                  fontSize: 28.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 350.0,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: Color(0xFFFFBD9D),
                  ),
                  onPressed: () {
                    Get.offNamed("/first/login");
                  },
                  child: const Text(
                    '로그인 하러 가기',
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontSize: 28.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 350.0,
                height: 60,
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
                              '정보!',
                              style: TextStyle(
                                fontFamily: "Gosan",
                                fontSize: 24.0,
                                color: Colors.black,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(children: <Widget>[
                                Text(
                                  '아이디를 따로 치지 않으셔도 됩니다.',
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
                                  Get.offNamed("/first/login/findingPW",
                                      arguments: _ID);
                                },
                                child: Text('예'),
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text(
                    '비밀번호 찾기',
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
