import 'package:chimap_actual/utils/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfomationCheck extends StatelessWidget {
  InfomationCheck({Key? key}) : super(key: key);
  UInfo uInfo = Get.arguments;

  CollectionReference database = FirebaseFirestore.instance.collection('user');
  late QuerySnapshot querySnapshot;
  int i = 0;
  bool find = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        querySnapshot = await database.get();
        for (i = 0; i < querySnapshot.docs.length; i++) {
          var a = querySnapshot.docs[i];
          if(!uInfo.id.isEmpty){
            if (a.get('name') ==  uInfo.userName && a.get('phone') ==  uInfo.userPhoneNum
                && a.get('uid') ==  uInfo.id) {
              String password = a.get('password');

              uInfo.setPassword(password);
              Get.offNamed("/first/login/findingIDinfo", arguments: uInfo);
              find = true;
            }
          }
          else{
            if (a.get('name') ==  uInfo.userName && a.get('phone') ==  uInfo.userPhoneNum ) {
              String id = a.get('uid');

              uInfo.setID(id);
              Get.offNamed("/first/login/findingIDinfo", arguments: uInfo);
              find = true;
            }
          }

        }
        if(!find){
          Get.offNamed('/first/login', arguments: uInfo);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFCAB0),
        body: _bodyWidget(),
      ),


    );
  }

  _bodyWidget() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: const CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
