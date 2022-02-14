import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LocationSearchPage extends StatefulWidget {
  const LocationSearchPage({Key? key}) : super(key: key);

  @override
  _LocationSearchPageState createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  final _locationFormKey = GlobalKey<FormState>();
  final TextEditingController _locataionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('주소찾기'),
          backgroundColor: const Color(0xFFFFCAB0),
        ),
        //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    List<bool> isSelected = List.generate(2, (index) => false);
    var address;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _locationFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 300,
                      height: 60,
                      child: TextFormField(
                        controller: _locataionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '주소를 입력해주세요',
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      child: Text(
                        '찾기',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: 14.0,
                          color: Colors.black87,
                        ),
                      ),
                      onPressed: () async {
                        address = _locataionController.text;
                        var url = Uri.parse('https://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage=1&countPerPage=10&keyword=$address&confmKey=devU01TX0FVVEgyMDIyMDIwNzE2NDk0NzExMjIxNDk=&hstryYn=Y');
                      },
                    ),
                  ],
                ),
                Text('ddd'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
