import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPWPage extends StatelessWidget {
  ResetPWPage({Key? key}) : super(key: key);

  final _PWresetFormKey = GlobalKey<FormState>();
  final TextEditingController _resetPWController = TextEditingController();
  final TextEditingController _resetPWConfirmController =
      TextEditingController();

  final resetController = Get.put(ResetController());
  final resetConfirmController = Get.put(ResetConfirmController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('비밀번호 재설정'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _PWresetFormKey,
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
                  '비밀번호를 재설정합니다.',
                  style: TextStyle(
                    fontFamily: "Gosan",
                    fontSize: 25.0,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 50,
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
                  height: 80,
                  child: Obx(
                    () => TextFormField(
                      controller: _resetPWController,
                      obscureText: !resetController.visibility.value,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            resetController.visible();
                          },
                          icon: Icon(
                            resetController.visibility.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        hintText: '비밀번호 입력',
                      ),
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
                  height: 80,
                  child: Obx(
                    () => TextFormField(
                      controller: _resetPWConfirmController,
                      obscureText: !resetConfirmController.visibility.value,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            resetConfirmController.visible();
                          },
                          icon: Icon(
                            resetConfirmController.visibility.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        hintText: '비밀번호를 다시 한번 입력해주세요',
                      ),
                    ),
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
                      Get.offNamed("/first/login/compresetPW");
                    },
                    child: const Text(
                      '비밀번호 재설정',
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
        ),
      ),
    );
  }
}

class ResetController extends GetxController {
  var visibility = false.obs;
  var isLoging = false.obs;

  visible() {
    visibility.value ? visibility.value = false : visibility.value = true;
    update();
  }

  loging() {
    isLoging.value = true;
    update();
  }

  notLoging() {
    isLoging.value = false;
    update();
  }
}

class ResetConfirmController extends GetxController {
  var visibility = false.obs;
  var isLoging = false.obs;

  visible() {
    visibility.value ? visibility.value = false : visibility.value = true;
    update();
  }

  loging() {
    isLoging.value = true;
    update();
  }

  notLoging() {
    isLoging.value = false;
    update();
  }
}
