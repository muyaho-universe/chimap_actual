import 'package:flutter/material.dart';

class ResultChimaePage extends StatelessWidget {
  const ResultChimaePage({Key? key}) : super(key: key);

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
              '진단 결과',
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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('치매의심이 됩니다.',
            style: TextStyle(
              fontFamily: "Gosan",
              fontSize: 24.0,
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}
