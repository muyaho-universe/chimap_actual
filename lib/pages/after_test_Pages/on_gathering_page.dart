import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnGatheringPage extends StatelessWidget {
  const OnGatheringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '자료 수집 중',
              style: TextStyle(
                fontFamily: "Gosan",
                fontSize: 28.0,
                color: Colors.black87,
              ),
            ),
            backgroundColor: const Color(0xFFFFCAB0),
            centerTitle: true, // 중앙 정렬
            elevation: 0.0,
          ),
          //backgroundColor: Colors.white,
          body: _bodyWidget(),
        ),
      ),
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            SizedBox(height: 20,),
            SizedBox(
              width: 200,
              height: 200,
              child: const CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40,),
            Text('데이터 수집 중입니다. \n\n7일 뒤에 다시 접속해 주세요',
              style: TextStyle(
                fontFamily: "Gosan",
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Color(0xFF000000),
              ),),
            SizedBox(height:30),
            Container(
              width: 256,
              height: 70,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: Color(0xEBFFBD9D),
                ),
                onPressed: () {
                  Get.toNamed('/testInitPage');
                },
                icon: Icon(Icons.check),
                label: Text(
                  '검사하기',
                  style: TextStyle(
                    fontFamily: "Gosan",
                    fontSize: 25.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
