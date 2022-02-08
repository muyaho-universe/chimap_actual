import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpApp extends StatefulWidget {
  const HttpApp({Key? key}) : super(key: key);

  @override
  _HttpAppState createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('무야호'),
        ),
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Container(
        child: Center(
          // child: se,
        ),
    );
  }
}
