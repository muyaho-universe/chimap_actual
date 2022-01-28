import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnerSignUpPage1 extends StatelessWidget {
  PartnerSignUpPage1({Key? key}) : super(key: key);

  final _signUpFormKey = GlobalKey<FormState>();

  // final signUpController = Get.put(SignUpController());
  //
  // final TextEditingController _signUpEmailController = TextEditingController();

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
                children: [
                  SizedBox(
                    height: 140.0,
                  ),
                  Text(
                    "이름을 입력해주세요",
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
                      decoration: InputDecoration(
                        hintText: '이름을 입력해주세요.',
                      ),
                    ),
                  ),
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
                    Get.offNamed("/first/signup");
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
              SizedBox(width: 10,),
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
                    Get.toNamed("/first/login/signup/partner2");
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
    );
  }
}

class SignUpController extends GetxController {
  var visibility = false.obs;
  var visibilityCheck = false.obs;
  var isRegistering = false.obs;

  visible() {
    visibility.value ? visibility.value = false : visibility.value = true;
    update();
  }

  visibleCheck() {
    visibilityCheck.value
        ? visibilityCheck.value = false
        : visibilityCheck.value = true;
    update();
  }

  registering() {
    isRegistering.value = true;
    update();
  }

  notRegistering() {
    isRegistering.value = false;
    update();
  }
}
