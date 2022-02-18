import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              ),)
          ],
        ),
      ),
    );
  }
}
