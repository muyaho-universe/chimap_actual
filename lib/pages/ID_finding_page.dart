import 'package:chimap_actual/utils/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';

class IDFindingPage extends StatefulWidget {
  IDFindingPage({Key? key}) : super(key: key);

  @override
  _IDFindingPageState createState() => _IDFindingPageState();
}

class _IDFindingPageState extends State<IDFindingPage> {
  DateTime _selectedDate = DateTime.now();

  final _IDfindingFormKey = GlobalKey<FormState>();
  // final userController = Get.put(UserController());

  final TextEditingController _findingNameController = TextEditingController();
  final TextEditingController _findingNumberController =
      TextEditingController();
  late String _name = _findingNameController.text;
  late String _num = _findingNumberController.text;
  var type = 100;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('아이디 찾기'),
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
      child: Center(
        child: Form(
          key: _IDfindingFormKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 75,
                ),
                Text(
                  '찾고싶은 사용자 정보를',
                  style: TextStyle(
                    fontFamily: "Gosan",
                    fontSize: 25.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '입력해주세요',
                  style: TextStyle(
                    fontFamily: "Gosan",
                    fontSize: 25.0,
                    color: Colors.black87,
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
                      '이름:',
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
                    controller: _findingNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '찾고자 하는 이름을 적어주세요.',
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
                      '전화번호:',
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
                    controller: _findingNumberController,
                    inputFormatters: [
                      MultiMaskedTextInputFormatter(
                          masks: ['xxx-xxxx-xxxx', 'xxx-xxx-xxxx'],
                          separator: '-')
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '찾고자 하는 사람의 번호를 적어주세요.',
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
                      '생년월일:',
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
                  width: 150,
                  height: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${DateFormat('yyyy').format(_selectedDate)}.${_selectedDate.month}.${_selectedDate.day}',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: 20.0,
                          color: Color(0xFF6A74CF),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: Color(0xEBFFBD9D),
                  ),
                  child: Container(
                    width: 175,
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'asset/images/calenderIcon.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        const Text(
                          '날짜선택',
                          style: TextStyle(
                            fontFamily: "Gosan",
                            fontSize: 28.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Future<DateTime?> future = showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    future.then((date) {
                      setState(() {
                        _selectedDate = date!.add(const Duration(hours: 9));
                      });
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 200.0,
                  height: 75.0,
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
                      _name = _findingNameController.text;
                      _num = _findingNumberController.text;
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                '입력정보가 맞으신가요?',
                                style: TextStyle(
                                  fontFamily: "Gosan",
                                  fontSize: 24.0,
                                  color: Colors.black,
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(children: <Widget>[
                                  Row(
                                    children: [
                                      Text(
                                        '이름: ',
                                        style: TextStyle(
                                          fontFamily: "Gosan",
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        '$_name',
                                        style: TextStyle(
                                          fontFamily: "Gosan",
                                          fontSize: 18.0,
                                          color: Color(0xFF6A74CF),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '생년월일: ',
                                        style: TextStyle(
                                          fontFamily: "Gosan",
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        '${DateFormat('yyyy').format(_selectedDate)}.${_selectedDate.month}.${_selectedDate.day}',
                                        style: TextStyle(
                                          fontFamily: "Gosan",
                                          fontSize: 18.0,
                                          color: Color(0xFF6A74CF),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '전화번호: ',
                                        style: TextStyle(
                                          fontFamily: "Gosan",
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        '$_num',
                                        style: TextStyle(
                                          fontFamily: "Gosan",
                                          fontSize: 18.0,
                                          color: Color(0xFF6A74CF),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                    '맞으시면 "예"를 눌러주세요',
                                    style: TextStyle(
                                      fontFamily: "Gosan",
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ]),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('아니오'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.offNamed("/first/login/signup/numberAuth", arguments: type);
                                  },
                                  child: Text('예'),
                                ),
                              ],
                            );
                          }); //ShowDialog
                    },
                    child: const Text(
                      '아이디 찾기',
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
