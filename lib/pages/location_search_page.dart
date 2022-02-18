import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chimap_actual/repository/location_search.dart';



class LocationSearchPage extends StatefulWidget {
  const LocationSearchPage({Key? key}) : super(key: key);

  @override
  _LocationSearchPageState createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  final searchTec = TextEditingController();
  final scrollController = ScrollController();
  final addressBloc = AddressBloc();
  List<Juso> addressList = [];
  late String keyword="", errorMessage = "검색어를 입력하세요.";
  late int page;
  late String ADD;

  final _locationFormKey = GlobalKey<FormState>();
  final TextEditingController _locataionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addAddressStreamListener();
    addScrollListener();
    addTextEditListener();
  }

  addAddressStreamListener() {
    addressBloc.address.listen(
          (list) {
        addressList = list;
        setState(() {});
      },
      onError: (error, stacktrace) {
        print("onError: $error");
        print(stacktrace.toString());

        if (error is ErrorModel == false) return;

        ErrorModel errorModel = error;
        if (page == 1) addressList = [];
        if (errorModel.error == -101) page = -1;

        errorMessage = errorModel.message;
        setState(() {});
      },
    );
  }
  addScrollListener() {
    scrollController.addListener(() {
      FocusScope.of(context).requestFocus(new FocusNode());
    });
  }
  addTextEditListener() {
    searchTec.addListener(() async {
      if (keyword == searchTec.text) return;

      keyword = searchTec.text;
      page = 1;
      addressBloc.fetchAddress(keyword, page);

    });
  }

  @override
  void dispose() {
    addressBloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('주소찾기'),
          backgroundColor: const Color(0xFFFFCAB0),
        ), //backgroundColor: Colors.white,
        body: _bodyWidget(),
      ),
    );
  }


  _bodyWidget() {

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _locationFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(child: searchTextField(),flex:10),
                    SizedBox(width:10),
                  ],
                ),
                Expanded(child: listView()),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget searchTextField() {
    return Container(
      width:300,
      height: 60,
      child: TextField(
        controller: searchTec,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "주소를 입력해 주세요.",
          hintStyle: TextStyle(color: Color(0xFFA0A0A0)),
        ),
      ),
    );
  }

  Widget listView() {
    if (addressList.length == 0) {
      return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 15,
              color: Color(0xFFEdEdEd),
            ),
            Expanded(
                child: Center(
                  child: Text(errorMessage),
                ))
          ],
        ),
      );
    }
    return ListView.builder(
      controller: scrollController,
      itemCount: addressList.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) return Container(height: 15, color: Color(0xFFEdEdEd));
        if (index == addressList.length) addAddressList();

        final address = addressList[index - 1];
        return Column(
          children: [
            listItem(address),
            Container(height: 1, color: Color(0xFFEdEdEd)),
          ],
        );
      },
    );
  }
  Widget listItem(Juso address) {
    final roadLast = address.buldSlno == '0' ? '' : '-' + address.buldSlno;
    final rodaTitle = '${address.rn} ${address.buldMnnm}$roadLast';
    final title = address.bdNm.isEmpty ? rodaTitle : address.bdNm;

    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              address.jibunAddr,
              style: TextStyle(color: Color(0xFFA8A8A8)),
            ),
            Text(
              '[도로명] ' + address.roadAddr,
              style: TextStyle(color: Color(0xFFA8A8A8)),
            ),
          ],
        ),
        onTap: () {
          showDialog(
              context: context,
              barrierDismissible:false,
              builder: (BuildContext context){
                return AlertDialog(

                  title: Text(
                    '선택하신 주소가 맞으신가요?',
                    style: TextStyle(
                      fontFamily: "Gosan",
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                  ),

                  content:SingleChildScrollView(
                    child:ListBody(children:<Widget>[
                      Row(
                        children: [
                          Container(
                            width: 250,
                            height:40,
                            child: Text(
                              address.roadAddr,
                              softWrap: true,
                              style:TextStyle(
                                fontFamily: "Gosan",
                                fontSize: 18.0,
                                color: Color(0xFF6A74CF),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:15.0),
                      Text(
                        '맞으시면 "예"를 눌러주세요',
                        style: TextStyle(
                          fontFamily: "Gosan",
                          fontSize: 18.0,
                          color: Colors.black87,
                        ),
                      ),
                    ]),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('아니오'),
                    ),
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          ADD = address.roadAddr;
                        });
                        Get.offNamed("/first/login/signup/IDandPW", arguments: ADD);
                      },
                      child: Text('예'),
                    ),
                  ],
                );
              });
        }
      )

      ,
    );
  }

  addAddressList() {
    if (page == -1) return;
    ++page;
    addressBloc.fetchAddress(keyword, page);
  }
}




