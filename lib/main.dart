import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/first_page.dart';
import 'pages/found_account_page.dart';
import 'pages/information_confirm_page.dart';
import 'pages/login_page.dart';
import 'pages/partner_signup_page2.dart';
import 'pages/partner_signup_page3.dart';
import 'pages/signup_page.dart';
import 'pages/partner_signup_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized(); // Flutter 비동기 실행을 위한 코드
  // await Firebase.initializeApp(); // Firebase 초기화
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chimap-Actual',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
      theme: new ThemeData(
        primarySwatch: createMaterialColor(Color(0xFFFFBD9D)),
      ),
      initialRoute: '/first',
      getPages: [
        GetPage(
          name: '/first',
          page: () => FirstPage(),
        ),
        GetPage(
          name: '/first/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/first/signup',
          page: () => SignUpPage(),
        ),
        GetPage(
          name: '/first/login/signup',
          page: () => SignUpPage(),
        ),
        GetPage(
          name: '/first/login/signup/partner1',
          page: () => PartnerSignUpPage1(),
        ),
        GetPage(
          name: '/first/login/signup/partner2',
          page: () => PartnerSignUpPage2(),
        ),
        GetPage(
          name: '/first/login/signup/partner3',
          page: () => PartnerSignUpPage3(),
        ),
        GetPage(
          name: '/first/login/accountfound',
          page: () => FoundPageSelectPage(),
        ),
        GetPage(
          name: '/first/login/signup/infoConfirm',
          page: () => informationConfirmPage(),
        ),
        // GetPage(
        //   name: '/login/partner',
        //   page: () => PartnerPage(),
        // ),
        // GetPage(
        //   name: '/login/patient',
        //   page: () => PatientPage(),
        // ),
      ],
    );
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
