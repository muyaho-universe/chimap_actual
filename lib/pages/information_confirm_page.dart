import 'package:chimap_actual/utils/user_model.dart';
import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}
