import 'package:flutter/material.dart';
import 'package:chimap_actual/utils/test_model.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TestsPage extends StatefulWidget {
  const TestsPage({Key? key}) : super(key: key);

  @override
  _TestsPageState createState() => _TestsPageState();
}

class _TestsPageState extends State<TestsPage> {
  final FlutterTts tts = FlutterTts();

  int currentPage = 0;
  int num = 1;

  double numFSize = 24.0;
  double QFSize = 24.0;
  double AFSize = 18.0;

  bool onTap1_1 = false;
  bool onTap1_2 = false;
  bool onTap1_3 = false;
  bool onTap1_4 = false;
  bool onTap1_5 = false;

  bool onTap2_1 = false;
  bool onTap2_2 = false;
  bool onTap2_3 = false;
  bool onTap2_4 = false;
  bool onTap2_5 = false;

  bool onTap3_1 = false;
  bool onTap3_2 = false;
  bool onTap3_3 = false;
  bool onTap3_4 = false;
  bool onTap3_5 = false;

  bool onTap4_1 = false;
  bool onTap4_2 = false;
  bool onTap4_3 = false;
  bool onTap4_4 = false;
  bool onTap4_5 = false;

  bool onTap5_1 = false;
  bool onTap5_2 = false;
  bool onTap5_3 = false;
  bool onTap5_4 = false;
  bool onTap5_5 = false;

  bool onTap6_1 = false;
  bool onTap6_2 = false;
  bool onTap6_3 = false;
  bool onTap6_4 = false;
  bool onTap6_5 = false;

  bool onTap7_1 = false;
  bool onTap7_2 = false;
  bool onTap7_3 = false;
  bool onTap7_4 = false;
  bool onTap7_5 = false;

  bool onTap8_1 = false;
  bool onTap8_2 = false;
  bool onTap8_3 = false;
  bool onTap8_4 = false;
  bool onTap8_5 = false;

  double sum = 0.0;
  int index1 = 0;
  int index2 = 0;
  int index3 = 0;
  int index4 = 0;
  int index5 = 0;
  int index6 = 0;
  int index7 = 0;
  int index8 = 0;

  double count = 8.0;

  List<double> ask = [0.0, 1.0, 2.0, 3.0, 4.0];
  final PageController controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    tts.setLanguage('kr');
    tts.setSpeechRate(0.4);

    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '치매진단',
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
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      onPageChanged: (page) {
        setState(() {});
      },
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                SizedBox(height: 25.0),
                Container(
                    width: 300,
                    height: 200,
                    child: Column(
                      children: [
                        Text(
                          '$num번: 시장보기',
                          style: TextStyle(
                            fontFamily: "Gosan",
                            fontSize: numFSize,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '상점에 가서 계획한 물건들을 잊지 않으며 돈 계산에 실수 없이 구매합니까?',
                          style: TextStyle(
                            fontFamily: "Gosan",
                            fontSize: QFSize,
                            color: Colors.black87,
                          ),
                        ),
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
                              tts.speak(
                                  '1번: 시장보기.. 상점에 가서 계획한 물건들을 잊지 않으며 돈 계산에 실수 없이 구매합니까?   1번 혼자 가능, 2번 약간 도움이 필요, 3번 많은 도움이 필요, 4번 불가능, 5번 해당없음, 선택하시고 다음을 눌러주세요');
                            },
                            icon: Icon(Icons.speaker),
                            label: Text(
                              '음성',
                              style: TextStyle(
                                fontFamily: "Gosan",
                                fontSize: 25.0,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap1_1 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '혼자 가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap1_1 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index1 = 0;
                        onTap1_1 = true;
                        onTap1_2 = false;
                        onTap1_3 = false;
                        onTap1_4 = false;
                        onTap1_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap1_2 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '약간 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap1_2 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index1 = 1;
                        onTap1_1 = false;
                        onTap1_2 = true;
                        onTap1_3 = false;
                        onTap1_4 = false;
                        onTap1_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap1_3 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '많은 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap1_3 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index1 = 2;
                        onTap1_1 = false;
                        onTap1_2 = false;
                        onTap1_3 = true;
                        onTap1_4 = false;
                        onTap1_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap1_4 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '불가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap1_4 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index1 = 3;
                        onTap1_1 = false;
                        onTap1_2 = false;
                        onTap1_3 = false;
                        onTap1_4 = true;
                        onTap1_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap1_5 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '해당없음',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap1_5 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index1 = 4;
                        onTap1_1 = false;
                        onTap1_2 = false;
                        onTap1_3 = false;
                        onTap1_4 = false;
                        onTap1_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 131.0,
                      height: 31.0,
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
                          primary: (!(onTap1_1|onTap1_2|onTap1_3|onTap1_4|onTap1_5))? Colors.grey :Color(0xFFFFBD9D),
                        ),
                        onPressed: (!(onTap1_1|onTap1_2|onTap1_3|onTap1_4|onTap1_5))? null : () {
                          tts.stop();
                          if (index1 == 4) {
                            count--;
                          } else {
                            sum += ask[index1];
                          }
                          print(sum);
                          num++;
                          currentPage++;
                          controller.jumpToPage(currentPage);
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
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                SizedBox(height: 25.0),
                Container(
                  width: 300,
                  height: 200,
                  child: Column(
                    children: [
                      Text(
                        '$num번: 돈 관리',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: numFSize,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '용돈을 관리하고, 은행에 가서 저축을 하는 등의 돈과 관련된 일을 처리합니까?',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: QFSize,
                          color: Colors.black87,
                        ),
                      ),
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
                            tts.speak(
                                '2번: 돈 관리.. 용돈을 관리하고, 은행에 가서 저축을 하는 등의 돈과 관련된 일을 처리합니까?   1번 혼자 가능, 2번 약간 도움이 필요, 3번 많은 도움이 필요, 4번 불가능, 5번 해당없음, 선택하시고 다음을 눌러주세요');
                          },
                          icon: Icon(Icons.speaker),
                          label: Text(
                            '음성',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 25.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap2_1 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '혼자 가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap2_1 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index2 = 0;
                        onTap2_1 = true;
                        onTap2_2 = false;
                        onTap2_3 = false;
                        onTap2_4 = false;
                        onTap2_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap2_2 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '약간 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap2_2 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index2 = 1;
                        onTap2_1 = false;
                        onTap2_2 = true;
                        onTap2_3 = false;
                        onTap2_4 = false;
                        onTap2_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap2_3 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '많은 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap2_3 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index2 = 2;
                        onTap2_1 = false;
                        onTap2_2 = false;
                        onTap2_3 = true;
                        onTap2_4 = false;
                        onTap2_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap2_4 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '불가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap2_4 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index2 = 3;
                        onTap2_1 = false;
                        onTap2_2 = false;
                        onTap2_3 = false;
                        onTap2_4 = true;
                        onTap2_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap2_5 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '해당없음',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap2_5 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index2 = 4;
                        onTap2_1 = false;
                        onTap2_2 = false;
                        onTap2_3 = false;
                        onTap2_4 = false;
                        onTap2_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          tts.stop();
                          if (index1 == 4) {
                            count++;
                          } else {
                            sum -= ask[index1];
                          }
                          num--;
                          currentPage--;
                          controller.jumpToPage(currentPage);
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
                          primary: (!(onTap1_1|onTap1_2|onTap1_3|onTap1_4|onTap1_5))? Colors.grey :Color(0xFFFFBD9D),
                        ),
                        onPressed: (!(onTap2_1|onTap2_2|onTap2_3|onTap2_4|onTap2_5))? null :() {
                          tts.stop();
                          if (index2 == 4) {
                            count--;
                          } else {
                            sum += ask[index2];
                          }
                          print(sum);
                          num++;
                          currentPage++;
                          controller.jumpToPage(currentPage);
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
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                SizedBox(height: 25.0),
                Container(
                  width: 300,
                  height: 200,
                  child: Column(
                    children: [
                      Text(
                        '$num번: 기구 사용과 집안 일하기',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: numFSize,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '진공청소기, 다리미 등의 기구들을 잘 다루고 일상적인 집안 일(예: 청소, 화초 물주기, 설거지)을 예전처럼 말끔하게 합니까?',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: QFSize,
                          color: Colors.black87,
                        ),
                      ),
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
                            tts.speak(
                                '3번: 기구 사용과 집안 일하기.. 진공청소기, 다리미 등의 기구들을 잘 다루고 일상적인 집안 일(예: 청소, 화초 물주기, 설거지)을 예전처럼 말끔하게 합니까?   1번 혼자 가능, 2번 약간 도움이 필요, 3번 많은 도움이 필요, 4번 불가능, 5번 해당없음, 선택하시고 다음을 눌러주세요');
                          },
                          icon: Icon(Icons.speaker),
                          label: Text(
                            '음성',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 25.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap3_1 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '혼자 가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap3_1 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index3 = 0;
                        onTap3_1 = true;
                        onTap3_2 = false;
                        onTap3_3 = false;
                        onTap3_4 = false;
                        onTap3_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap3_2 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '약간 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap3_2 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index3 = 1;
                        onTap3_1 = false;
                        onTap3_2 = true;
                        onTap3_3 = false;
                        onTap3_4 = false;
                        onTap3_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap3_3 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '많은 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap3_3 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index3 = 2;
                        onTap3_1 = false;
                        onTap3_2 = false;
                        onTap3_3 = true;
                        onTap3_4 = false;
                        onTap3_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap3_4 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '불가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap3_4 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index3 = 3;
                        onTap3_1 = false;
                        onTap3_2 = false;
                        onTap3_3 = false;
                        onTap3_4 = true;
                        onTap3_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap3_5 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '해당없음',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap3_5 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index3 = 4;
                        onTap3_1 = false;
                        onTap3_2 = false;
                        onTap3_3 = false;
                        onTap3_4 = false;
                        onTap3_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          tts.stop();
                          if (index2 == 4) {
                            count++;
                          } else {
                            sum -= ask[index2];
                          }
                          num--;
                          currentPage--;
                          controller.jumpToPage(currentPage);
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
                          primary: (!(onTap3_1|onTap3_2|onTap3_3|onTap3_4|onTap3_5))? Colors.grey :Color(0xFFFFBD9D),
                        ),
                        onPressed: (!(onTap3_1|onTap3_2|onTap3_3|onTap3_4|onTap3_5))? null :() {
                          tts.stop();
                          if (index3 == 4) {
                            count--;
                          } else {
                            sum += ask[index3];
                          }
                          print(sum);
                          num++;
                          currentPage++;
                          controller.jumpToPage(currentPage);
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
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                SizedBox(height: 25.0),
                Container(
                  width: 300,
                  height: 200,
                  child: Column(
                    children: [
                      Text(
                        '$num번: 음식 준비',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: numFSize,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '적절한 식사를 계획하여 재료를 준비하고, 예전과 같이 맛있게 음식을 만듭니까?',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: QFSize,
                          color: Colors.black87,
                        ),
                      ),
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
                            tts.speak(
                                '4번: 음식 준비.. 적절한 식사를 계획하여 재료를 준비하고, 예전과 같이 맛있게 음식을 만듭니까?   1번 혼자 가능, 2번 약간 도움이 필요, 3번 많은 도움이 필요, 4번 불가능, 5번 해당없음, 선택하시고 다음을 눌러주세요');
                          },
                          icon: Icon(Icons.speaker),
                          label: Text(
                            '음성',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 25.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap4_1 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '혼자 가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap4_1 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index4 = 0;
                        onTap4_1 = true;
                        onTap4_2 = false;
                        onTap4_3 = false;
                        onTap4_4 = false;
                        onTap4_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap4_2 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '약간 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap4_2 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index4 = 1;
                        onTap4_1 = false;
                        onTap4_2 = true;
                        onTap4_3 = false;
                        onTap4_4 = false;
                        onTap4_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap4_3 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '많은 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap4_3 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index4 = 2;
                        onTap4_1 = false;
                        onTap4_2 = false;
                        onTap4_3 = true;
                        onTap4_4 = false;
                        onTap4_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap4_4 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '불가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap4_4 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index4 = 3;
                        onTap4_1 = false;
                        onTap4_2 = false;
                        onTap4_3 = false;
                        onTap4_4 = true;
                        onTap4_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap4_5 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '해당없음',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap4_5 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index4 = 4;
                        onTap4_1 = false;
                        onTap4_2 = false;
                        onTap4_3 = false;
                        onTap4_4 = false;
                        onTap4_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          tts.stop();
                          if (index3 == 4) {
                            count++;
                          } else {
                            sum -= ask[index3];
                          }
                          num--;
                          currentPage--;
                          controller.jumpToPage(currentPage);
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
                          primary: (!(onTap4_1|onTap4_2|onTap4_3|onTap4_4|onTap4_5))? Colors.grey :Color(0xFFFFBD9D),
                        ),
                        onPressed: (!(onTap4_1|onTap4_2|onTap4_3|onTap4_4|onTap4_5))? null :() {
                          tts.stop();
                          if (index4 == 4) {
                            count--;
                          } else {
                            sum += ask[index4];
                          }
                          print(sum);
                          num++;
                          currentPage++;
                          controller.jumpToPage(currentPage);
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
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                SizedBox(height: 25.0),
                Container(
                  width: 300,
                  height: 200,
                  child: Column(
                    children: [
                      Text(
                        '$num번: 약 복용',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: numFSize,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '시간과 용량을 지켜 약을 먹습니까?',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: QFSize,
                          color: Colors.black87,
                        ),
                      ),
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
                            tts.speak(
                                '5번: 약 복용.. 시간과 용량을 지켜 약을 먹습니까?   1번 혼자 가능, 2번 약간 도움이 필요, 3번 많은 도움이 필요, 4번 불가능, 5번 해당없음, 선택하시고 다음을 눌러주세요');
                          },
                          icon: Icon(Icons.speaker),
                          label: Text(
                            '음성',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 25.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap5_1 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '혼자 가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap5_1 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index5 = 0;
                        onTap5_1 = true;
                        onTap5_2 = false;
                        onTap5_3 = false;
                        onTap5_4 = false;
                        onTap5_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap5_2 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '약간 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap5_2 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index5 = 1;
                        onTap5_1 = false;
                        onTap5_2 = true;
                        onTap5_3 = false;
                        onTap5_4 = false;
                        onTap5_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap5_3 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '많은 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap5_3 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index5 = 2;
                        onTap5_1 = false;
                        onTap5_2 = false;
                        onTap5_3 = true;
                        onTap5_4 = false;
                        onTap5_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap5_4 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '불가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap5_4 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index5 = 3;
                        onTap5_1 = false;
                        onTap5_2 = false;
                        onTap5_3 = false;
                        onTap5_4 = true;
                        onTap5_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap5_5 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '해당없음',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap5_5 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index5 = 4;
                        onTap5_1 = false;
                        onTap5_2 = false;
                        onTap5_3 = false;
                        onTap5_4 = false;
                        onTap5_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          tts.stop();
                          if (index4 == 4) {
                            count++;
                          } else {
                            sum -= ask[index4];
                          }
                          num--;
                          currentPage--;
                          controller.jumpToPage(currentPage);
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
                          primary: (!(onTap5_1|onTap5_2|onTap5_3|onTap5_4|onTap5_5))? Colors.grey :Color(0xFFFFBD9D),
                        ),
                        onPressed: (!(onTap5_1|onTap5_2|onTap5_3|onTap5_4|onTap5_5))? null :() {
                          tts.stop();
                          if (index5 == 4) {
                            count--;
                          } else {
                            sum += ask[index5];
                          }
                          print(sum);
                          num++;
                          currentPage++;
                          controller.jumpToPage(currentPage);
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
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                SizedBox(height: 25.0),
                Container(
                  width: 300,
                  height: 200,
                  child: Column(
                    children: [
                      Text(
                        '$num번: 취미 생활',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: numFSize,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '종교, 독서, 바둑, 장기, 화투, 산책, 등산, 운동 등의 예전에 하던 취미를 그대로 잘 수행합니까?',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: QFSize,
                          color: Colors.black87,
                        ),
                      ),
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
                            tts.speak(
                                '6번: 취미 생활.. 적종교, 독서, 바둑, 장기, 화투, 산책, 등산, 운동 등의 예전에 하던 취미를 그대로 잘 수행합니까?   1번 혼자 가능, 2번 약간 도움이 필요, 3번 많은 도움이 필요, 4번 불가능, 5번 해당없음, 선택하시고 다음을 눌러주세요');
                          },
                          icon: Icon(Icons.speaker),
                          label: Text(
                            '음성',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 25.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap6_1 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '혼자 가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap6_1 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index6 = 0;
                        onTap6_1 = true;
                        onTap6_2 = false;
                        onTap6_3 = false;
                        onTap6_4 = false;
                        onTap6_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap6_2 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '약간 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap6_2 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index6 = 1;
                        onTap6_1 = false;
                        onTap6_2 = true;
                        onTap6_3 = false;
                        onTap6_4 = false;
                        onTap6_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap6_3 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '많은 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap6_3 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index6 = 2;
                        onTap6_1 = false;
                        onTap6_2 = false;
                        onTap6_3 = true;
                        onTap6_4 = false;
                        onTap6_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap6_4 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '불가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap6_4 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index6 = 3;
                        onTap6_1 = false;
                        onTap6_2 = false;
                        onTap6_3 = false;
                        onTap6_4 = true;
                        onTap6_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap6_5 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '해당없음',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap6_5 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index6 = 4;
                        onTap6_1 = false;
                        onTap6_2 = false;
                        onTap6_3 = false;
                        onTap6_4 = false;
                        onTap6_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          tts.stop();
                          if (index5 == 4) {
                            count++;
                          } else {
                            sum -= ask[index5];
                          }
                          num--;
                          currentPage--;
                          controller.jumpToPage(currentPage);
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
                          primary: (!(onTap6_1|onTap6_2|onTap6_3|onTap6_4|onTap6_5))? Colors.grey :Color(0xFFFFBD9D),
                        ),
                        onPressed: (!(onTap6_1|onTap6_2|onTap6_3|onTap6_4|onTap6_5))? null : () {
                          tts.stop();
                          if (index6 == 4) {
                            count--;
                          } else {
                            sum += ask[index6];
                          }
                          print(sum);
                          num++;
                          currentPage++;
                          controller.jumpToPage(currentPage);
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
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                SizedBox(height: 25.0),
                Container(
                  width: 300,
                  height: 200,
                  child: Column(
                    children: [
                      Text(
                        '$num번: 텔레비전 시청',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: numFSize,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '집중해서 텔레비전을 보며 그 내용을 이해합니까?',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: QFSize,
                          color: Colors.black87,
                        ),
                      ),
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
                            tts.speak(
                                '7번: 텔레비전 시청.. 집중해서 텔레비전을 보며 그 내용을 이해합니까?   1번 혼자 가능, 2번 약간 도움이 필요, 3번 많은 도움이 필요, 4번 불가능, 5번 해당없음, 선택하시고 다음을 눌러주세요');
                          },
                          icon: Icon(Icons.speaker),
                          label: Text(
                            '음성',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 25.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap7_1 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '혼자 가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap7_1 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index7 = 0;
                        onTap7_1 = true;
                        onTap7_2 = false;
                        onTap7_3 = false;
                        onTap7_4 = false;
                        onTap7_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap7_2 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '약간 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap7_2 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index7 = 1;
                        onTap7_1 = false;
                        onTap7_2 = true;
                        onTap7_3 = false;
                        onTap7_4 = false;
                        onTap7_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap7_3 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '많은 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap7_3 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index7 = 2;
                        onTap7_1 = false;
                        onTap7_2 = false;
                        onTap7_3 = true;
                        onTap7_4 = false;
                        onTap7_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap7_4 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '불가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap7_4 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index7 = 3;
                        onTap7_1 = false;
                        onTap7_2 = false;
                        onTap7_3 = false;
                        onTap7_4 = true;
                        onTap7_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap7_5 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '해당없음',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap7_5 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index7 = 4;
                        onTap7_1 = false;
                        onTap7_2 = false;
                        onTap7_3 = false;
                        onTap7_4 = false;
                        onTap7_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          tts.stop();
                          if (index6 == 4) {
                            count++;
                          } else {
                            sum -= ask[index6];
                          }
                          num--;
                          currentPage--;
                          controller.jumpToPage(currentPage);
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
                          primary: (!(onTap7_1|onTap7_2|onTap7_3|onTap7_4|onTap7_5))? Colors.grey :Color(0xFFFFBD9D),
                        ),
                          onPressed: (!(onTap7_1|onTap7_2|onTap7_3|onTap7_4|onTap7_5))? null : () {
                            tts.stop();
                          if (index7 == 4) {
                            count--;
                          } else {
                            sum += ask[index7];
                          }
                          print(sum);
                          num++;
                          currentPage++;
                          controller.jumpToPage(currentPage);
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
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              children: [
                SizedBox(height: 25.0),
                Container(
                  width: 300,
                  height: 200,
                  child: Column(
                    children: [
                      Text(
                        '$num번: 집안 수리',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: numFSize,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '못박기나 전구 끼우기 같은 집안 잡일을 수행합니까?',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: QFSize,
                          color: Colors.black87,
                        ),
                      ),
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
                            tts.speak(
                                '8번: 집안 수리.. 못박기나 전구 끼우기 같은 집안 잡일을 수행합니까?   1번 혼자 가능, 2번 약간 도움이 필요, 3번 많은 도움이 필요, 4번 불가능, 5번 해당없음, 선택하시고 다음을 눌러주세요');
                          },
                          icon: Icon(Icons.speaker),
                          label: Text(
                            '음성',
                            style: TextStyle(
                              fontFamily: "Gosan",
                              fontSize: 25.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap8_1 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '혼자 가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap8_1 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index8 = 0;
                        onTap8_1 = true;
                        onTap8_2 = false;
                        onTap8_3 = false;
                        onTap8_4 = false;
                        onTap8_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap8_2 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '약간 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap8_2 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index8 = 1;
                        onTap8_1 = false;
                        onTap8_2 = true;
                        onTap8_3 = false;
                        onTap8_4 = false;
                        onTap8_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap8_3 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '많은 도움이 필요',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap8_3 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index8 = 2;
                        onTap8_1 = false;
                        onTap8_2 = false;
                        onTap8_3 = true;
                        onTap8_4 = false;
                        onTap8_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap8_4 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '불가능',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap8_4 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index8 = 3;
                        onTap8_1 = false;
                        onTap8_2 = false;
                        onTap8_3 = false;
                        onTap8_4 = true;
                        onTap8_5 = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFA6A6A6)),
                    color: onTap8_5 ? const Color(0xFFFFCAB0) : Colors.white,
                  ),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        '해당없음',
                        style: TextStyle(
                          fontSize: AFSize,
                          color: onTap8_5 ? Colors.white : Colors.black,
                          fontFamily: 'Gosan',
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        index8 = 4;
                        onTap8_1 = false;
                        onTap8_2 = false;
                        onTap8_3 = false;
                        onTap8_4 = false;
                        onTap8_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          tts.stop();
                          if (index7 == 4) {
                            count++;
                          } else {
                            sum -= ask[index7];
                          }
                          num--;
                          currentPage--;
                          controller.jumpToPage(currentPage);
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
                          primary: (!(onTap8_1|onTap8_2|onTap8_3|onTap8_4|onTap8_5))? Colors.grey :Color(0xFFFFBD9D),
                        ),
                        onPressed: (!(onTap8_1|onTap8_2|onTap8_3|onTap8_4|onTap8_5))? null : () {
                          tts.stop();
                          if (index8 == 4) {
                            count--;
                          } else {
                            sum += ask[index8];
                          }
                          print(sum);
                          double avg = sum / count;
                          if (avg >= 0.47) {
                            print('치매 $avg');
                          } else {
                            print('안심하세요 $avg');
                          }
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
      ],
    );
  }
}
