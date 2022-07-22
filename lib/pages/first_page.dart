import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFCAB0),
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      children: <Widget>[
        const SizedBox(height: 75.0),
        Column(
          children: <Widget>[
            Image.asset(
              'asset/images/homeimage.png',
              width: 256,
              height: 275,
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: Text(
            "환영합니다!",
            style: TextStyle(
              fontFamily: "Gosan",
              fontSize: 50.0,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ),
        const SizedBox(
          height: 73,
        ),
        Container(
          width: 256.0,
          height: 71.0,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.9))),
            onPressed: () {
              Get.toNamed('/first/login');
            },
            child: const Text(
              '로그인',
              style: TextStyle(
                fontFamily: "Gosan",
                fontSize: 28.0,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        Container(
          width: 256.0,
          height: 71.0,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white.withOpacity(0.9))),
            onPressed: () {
              Get.toNamed('/first/signup');
            },
            child: const Text(
              '회원가입',
              style: TextStyle(

                fontFamily: "Gosan",
                fontSize: 28.0,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
