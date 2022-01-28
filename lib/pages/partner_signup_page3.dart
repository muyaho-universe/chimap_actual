import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';

class PartnerSignUpPage3 extends StatelessWidget {
  PartnerSignUpPage3({Key? key}) : super(key: key);

  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('보호자 회원가입'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Padding(
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
                      inputFormatters: [
                        MultiMaskedTextInputFormatter(
                            masks: ['xxx-xxxx-xxxx', 'xxx-xxx-xxxx'],
                            separator: '-')
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '-를 빼고 번호만 입력해주세요.',
                      ),
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
                    Get.offNamed('/first/login/signup/partner2');
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
                  onPressed: () {},
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
    );
  }
}
