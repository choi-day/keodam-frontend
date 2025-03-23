import 'package:flutter/material.dart';
import 'package:keodam_frontend/login/presentation/view/login_screen.dart';

import 'login/data/service/kakao_service.dart';

void main() async{
  await KakaoService.initialize();
  //debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'keodam',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
          fontFamily: 'Pretendard'
      ),
      home: const LoginScreen(),
      themeMode: ThemeMode.system,
    );
  }
}