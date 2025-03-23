import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:keodam_frontend/const/colors.dart';
import 'package:keodam_frontend/icon/keodam_icons_icons.dart';
import 'package:keodam_frontend/login/data/repository/kakaoLogin_controller.dart';
import 'package:keodam_frontend/login/data/repository/googleLogin_controller.dart';

import '../../data/repository/appleLogin_controller.dart';

final dio = Dio();
const secureStorage = FlutterSecureStorage();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: MAIN_BACKGROUND_COLOR,
        body: Container(
          margin: EdgeInsets.fromLTRB(size.width * 0.06, size.height * 0.19, size.width * 0.06, size.height * 0.17),
          child: Column(
            children: [
              Flexible(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(KeodamIcons.logo2, color: MAIN_COLOR, size: size.width * 0.3,),
                    const Text("한 잔의 커피, 무한한 가능성의 대화" , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
              Flexible(
                flex: 8,
                fit: FlexFit.loose,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  [
                      const Text("원하는 방법을 통해 로그인 해주세요", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                      InkWell(
                        onTap: () {kakaoLogin();},
                        child: Image.asset("assets/images/kakaoLoginButton.png"),
                      ),
                      InkWell(
                        onTap: () {googleLogin();},
                        child: Image.asset("assets/images/googleLoginButton.png"),
                      ),
                      InkWell(
                        onTap: () {appleLogin();},
                        child: Image.asset("assets/images/appleLoginButton.png"),
                      ),
                      const Text("아직 계정이 없다면,\n버튼을 눌러 자동으로 회원가입으로 연결돼요" , style: TextStyle(color: SUB_TEXT_COLOR, fontSize: 12),)
                    ]
                ),
              ),
            ],
          ),
        )
    );
  }
}