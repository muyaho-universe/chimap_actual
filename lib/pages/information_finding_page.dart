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
      stream: FirebaseFirestore.instance.collection('mail').snapshots(),
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
            if(!uInfo.id.isEmpty){
              if(one.get('name')){

              }
            }

          }
        }

        return Center(
          child: CircularProgressIndicator(), //로딩되는 동그라미 보여주기
        );
      },
    );
  }
}
