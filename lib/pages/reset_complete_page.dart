import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PWResetCompletePage extends StatelessWidget {
  const PWResetCompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('비밀번호 재설정 완료'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '비밀번호가\n',
            style: TextStyle(
              fontFamily: "Gosan",
              fontSize: 25.0,
              color: Colors.black87,
            ),
          ),
          Text(
            '재설정 되었습니다.',
            style: TextStyle(
              fontFamily: "Gosan",
              fontSize: 25.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 50,),
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
    );
  }
}
