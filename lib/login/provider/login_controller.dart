// import 'package:flutter/material.dart';
// import 'package:flutter_kakao_login_with_provider/src/api/kakao_login_api.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

// class UserController with ChangeNotifier {
//   User? _user;
//   KakaoLoginApi kakaoLoginApi;
//   User? get user => _user;

//   UserController({required this.kakaoLoginApi});

//     void kakaoLogin() async {
//     kakaoLoginApi.signWithKakao().then((user) {
//       // 반환된 값이 NULL이 아니라면
//       // 정보 전달
//       if (user != null) {
//         _user = user;
//         notifyListeners();
//       }
//     });
//   }
// }