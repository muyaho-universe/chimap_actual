import 'package:chimap_actual/utils/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnerOnlyPage extends StatelessWidget {
  PartnerOnlyPage({Key? key}) : super(key: key);

  final _partnerFormKey = GlobalKey<FormState>();
  // final userController = Get.put(UserController());

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPhoneNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('대상자와 연동'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Form(
      key: _partnerFormKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Text(
            '대상자 연동',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Gosan",
              fontSize: 25.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '치매 검사를 진행할 어르신의 정보가 필요합니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Gosan",
              fontSize: 18.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '대상자 성함:',
                style: TextStyle(
                  fontFamily: "Gosan",
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 300,
            height: 60,
            child: TextFormField(
              controller: _userNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '대상자의 성함을 적어주세요.',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '대상자 전화번호:',
                style: TextStyle(
                  fontFamily: "Gosan",
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 300,
            height: 60,
            child: TextFormField(
              controller: _userPhoneNumController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '대상자의 전화번호를 적어주세요.',
              ),
            ),
          ),
          SizedBox(height: 75.0),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                  Get.offNamed('/first/login/signup/partner1');
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
                  Get.offNamed("/first/login/signup/complete");
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
          ]),
        ],
      ),
    );
  }
}
