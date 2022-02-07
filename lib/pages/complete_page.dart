import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('치맵'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        resizeToAvoidBottomInset: false, //키보드 올라와도 안밀리게 해줌
        backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Padding(
        padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                )
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10.0),
                    Image.asset(
                      'asset/images/check.png',
                      width: 130,
                      height: 130,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,),
            Text(
              '회원가입이',
              style: TextStyle(
                fontFamily: "Gosan",
                fontSize: 30.0,
                color: Colors.black87,
              ),
            ),
            Text(
              '완료되었습니다!',
              style: TextStyle(
                fontFamily: "Gosan",
                fontSize: 30.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 35,),
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
          ],
        ),
      ),
    );
  }
}
