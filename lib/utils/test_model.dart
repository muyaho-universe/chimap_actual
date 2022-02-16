import 'package:flutter/material.dart';

class CandWidget extends StatefulWidget {
  VoidCallback tap; //candwidget 에서 탭을 활용해서 온탭을 작동시킴
  String text;
  int index;
  double width;
  bool answerState;


  CandWidget({required this.tap, required this.index, required this.width, required this.text, required this.answerState});
  _CandWidgetState createState() => _CandWidgetState();

}
//1.2.3.4.5 문제 부분 버튼 해
class _CandWidgetState  extends State<CandWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.8,
      height: 72,
      padding : EdgeInsets.fromLTRB(
        widget.width * 0.24,
        widget.width * 0.05,
        widget.width * 0.24,
        widget.width * 0.024,

      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFA6A6A6)),
        color: widget.answerState ? const Color(0xFFFFCAB0): Colors.white,

      ),
      child: InkWell(
        child:Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.width * 0.07,
            color: widget.answerState ? Colors.white: Colors.black,
            fontFamily: 'Gosan',
          ),
        ),
        onTap :() {
          setState(() {
            widget.tap ();
            widget.answerState = !widget.answerState;
          });
        },
      ),
    );
  }
}