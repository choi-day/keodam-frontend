import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:keodam_frontend/login/view/login_screen.dart';

void main() async{
  await dotenv.load(fileName: 'assets/config/.env');
  String? kakaoNativeAppKey = dotenv.env['KAKAO_API_KEY'];
  String? javaScriptAppKey = dotenv.env['JAVASCRIPT_API_KEY'];

  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: kakaoNativeAppKey,
    javaScriptAppKey: javaScriptAppKey,
  );
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