import 'package:chimap_actual/utils/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IDandPWPage extends StatefulWidget {
  const IDandPWPage({Key? key}) : super(key: key);

  @override
  _IDandPWPageState createState() => _IDandPWPageState();
}

class _IDandPWPageState extends State<IDandPWPage> {
  final _IPsignUpFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  final TextEditingController _signUpIDController = TextEditingController();
  final TextEditingController _signUpPWController = TextEditingController();
  final TextEditingController _signUpPWConfirmController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('아이디와 비밀번호'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
              ),
              Text(
                '로그인에 사용할 아이디와',
                style: TextStyle(
                  fontFamily: "Gosan",
                  fontSize: 25.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '비밀번호를 적어주세요!',
                style: TextStyle(
                  fontFamily: "Gosan",
                  fontSize: 25.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '무야호',
                style: TextStyle(
                  fontFamily: "Gosan",
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 38,
                  ),
                  Text(
                    '아이디:',
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
                  controller: _signUpIDController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '아이디를 입력해주세요.',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 38,
                  ),
                  Text(
                    '비밀번호:',
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
                  controller: _signUpPWController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '비밀번호를 입력해주세요.',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 38,
                  ),
                  Text(
                    '비밀번호 확인:',
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
                  controller: _signUpPWController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '비밀번호를 다시 한번 입력해주세요.',
                  ),
                ),
              ),
              SizedBox(height: 15,),
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
                        '처음으로',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
