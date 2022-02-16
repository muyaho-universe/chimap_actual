import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TestInitPage extends StatelessWidget {
  TestInitPage({Key? key}) : super(key: key);

  final FlutterTts tts = FlutterTts();

  final String _FirstLine = '이제 더욱 정확한 치매진단을 위하여 몇 가지 검사를 하겠습니다.\n 본 검사는 강수진 의학 박사 외 5인이 대학 신경과학학회지에 발표한 K-IADL을 바탕으로 실시되고 있습니다.다음에 나오는 항목을 바탕으로 조사에 참여해주세요. 총 11개 항목입니다. 만약 해당이 없으면 해당없음을 눌러주세요.';
  // final String _SecondLine = '본 검사는 강수진 의학 박사 외 5인이 대학 신경과학학회지에 발표한';
  // final String _ThirdLine = 'K-IADL을 바탕으로 실시되고 있습니다.';
  // final String _FourthLine = '다음에 나오는 항목을 바탕으로 조사에 참여해주세요.';
  // final String _FifthLine = '총 11개 항목입니다.';
  // final String _SixthLine = '만약 해당이 없으면 해당없음을 눌러주세요.';

  @override
  Widget build(BuildContext context) {
    tts.setLanguage('kr');
    tts.setSpeechRate(0.4);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('K-IADL을 이용한 검사',
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
    );
  }

  _bodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              '$_FirstLine',
              style: TextStyle(
                fontFamily: "Gosan",
                fontSize: 25.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // Text(
            //   '$_SecondLine',
            //   style: TextStyle(
            //     fontFamily: "Gosan",
            //     fontSize: 25.0,
            //     color: Colors.black87,
            //   ),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
            // Text(
            //   '$_ThirdLine',
            //   style: TextStyle(
            //     fontFamily: "Gosan",
            //     fontSize: 25.0,
            //     color: Colors.black87,
            //   ),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
            // Text(
            //   '$_FourthLine',
            //   style: TextStyle(
            //     fontFamily: "Gosan",
            //     fontSize: 25.0,
            //     color: Colors.black87,
            //   ),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
            // Text(
            //   '$_FifthLine',
            //   style: TextStyle(
            //     fontFamily: "Gosan",
            //     fontSize: 25.0,
            //     color: Colors.black87,
            //   ),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
            // Text(
            //   '$_SixthLine',
            //   style: TextStyle(
            //     fontFamily: "Gosan",
            //     fontSize: 25.0,
            //     color: Colors.black87,
            //   ),
            // ),
            // SizedBox(
            //   height: 5,
            // ),
            Container(
              width: 150,
              height: 30,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: Color(0xEBFFBD9D),
                ),
                onPressed: () {
                  tts.speak(_FirstLine);

                },
                icon: Icon(Icons.speaker),
                label: Text(
                  '음성읽기',
                  style: TextStyle(
                    fontFamily: "Gosan",
                    fontSize: 25.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 150,
              height: 30,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: Color(0xEBFFBD9D),
                ),
                onPressed: () {

                },
                icon: Icon(Icons.speaker),
                label: Text(
                  'sss',
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
