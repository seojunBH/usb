import 'package:flutter/material.dart';
import 'package:usb/member/propass.dart';
import 'package:usb/member/sign.dart';
import 'package:usb/member/choice.dart';
import 'package:usb/member/loading.dart';
import 'package:usb/user/user.dart';
import 'package:usb/user/alarm.dart';
import 'package:usb/protector/protector.dart';
import 'package:usb/protector/schedule.dart';

import 'member/login.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko', null); // 한국어 포맷 초기화
  runApp(user());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LogIn(),
        '/sign': (context) => sign(),
        '/choice': (context) => const choice(),
        '/loading': (context) => const loading(),
        '/propass': (context) => propass(),
        '/user': (context) => user(),
        '/alarm': (context) => const Alarm(),
        '/protector': (context) => protector(),
        '/schedule': (context) => schedule(),
      },
    );
  }
}
