import 'package:chimap_actual/utils/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfomationCheck extends StatefulWidget {
  const InfomationCheck({Key? key}) : super(key: key);

  @override
  State<InfomationCheck> createState() => _InfomationCheckState();
}

class _InfomationCheckState extends State<InfomationCheck> {
  UInfo uInfo = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('user').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(), //로딩되는 동그라미 보여주기
          );
        }
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            var one = snapshot.data!.docs[i];
            if(!uInfo.id.isEmpty){      // password finding
              if(one.get('name') == uInfo.userName
                  && one.get('phone') == uInfo.userPhoneNum
              &&one.get('uid') == uInfo.id){

              }
            }
            else{     //id finding
              if(one.get('name') == uInfo.userName && one.get('phone') == uInfo.userPhoneNum){
                print('야호');
                uInfo.setID(one.get('id'));
                Get.toNamed('/first/login/findingIDinfo',arguments: uInfo);
              }
              else{
                // Get.toNamed('/first');
              }
            }
            return Center(
              child: CircularProgressIndicator(), //로딩되는 동그라미 보여주기
            );
          }
          return Center(
            child: CircularProgressIndicator(), //로딩되는 동그라미 보여주기
          );
        }

        return Center(
          child: CircularProgressIndicator(), //로딩되는 동그라미 보여주기
        );
      },
    );
  }
}
