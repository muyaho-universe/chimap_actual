import 'dart:async';

import 'package:chimap_actual/pages/first_page.dart';
import 'package:chimap_actual/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Center(
            child: Text("firebase load failed"),
          );
        }

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: const Color(0xFFFFCAB0),
            body: _bodyWidget(),
          ),
        );
      },
    );

  }

  _bodyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "치매조기 진단을 위한",
            style: TextStyle(
              fontFamily: "Gothic",
              fontSize: 24.0,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            "CHI-MAP",
            style: TextStyle(
              fontFamily: "Gothic",
              fontSize: 50.0,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
