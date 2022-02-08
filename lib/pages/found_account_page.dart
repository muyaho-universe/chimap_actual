import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoundPageSelectPage extends StatelessWidget {
  const FoundPageSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('계정찾기'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 117,),
                Image.asset(
                  'asset/images/question.png',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
            SizedBox(height: 50,),
            Container(
              width: 500,
              height: 80,
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
                  Get.toNamed('/first/login/findingID');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'asset/images/person.png',
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        "아이디 찾기",
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              width: 500,
              height: 80,
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
                  Get.toNamed('/first/login/findingPW');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'asset/images/lock.png',
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        "비밀번호 찾기",
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
