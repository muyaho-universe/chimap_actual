import 'package:chimap_actual/utils/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class informationConfirmPage extends StatefulWidget {
  informationConfirmPage({Key? key}) : super(key: key);

  @override
  _informationConfirmPageState createState() => _informationConfirmPageState();
}

class _informationConfirmPageState extends State<informationConfirmPage> {
  String? _userName;
  String _birthDate = '1998.04.10';
  String _phoneNumber = '010-4208-2214';
  late UserModel userModel;

  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        _userName = userModel.userName;
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
      padding: EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '입력하신 정보가 맞으신가요?',
            style: TextStyle(
              fontFamily: 'Gosan',
              fontSize: 24.0,
            ),
          ),
          SizedBox(height: 40,),
          Text(
            '$_userName',
            style: TextStyle(
              fontFamily: 'Gosan',
              fontSize: 24.0,
            ),
          ),
          SizedBox(height: 15,),
          Text(
            '$_birthDate',
            style: TextStyle(
              fontFamily: 'Gosan',
              fontSize: 24.0,
            ),
          ),
          SizedBox(height: 15,),
          Text(
            '$_phoneNumber',
            style: TextStyle(
              fontFamily: 'Gosan',
              fontSize: 24.0,
            ),
          ),
          SizedBox(height: 175.0),
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
                  onPressed: () {
                    Get.offNamed("/first/login/signup/numberAuth");
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
