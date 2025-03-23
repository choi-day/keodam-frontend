import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// Future<void> googleLogin() async{
// //  await dotenv.load(fileName: ".env");
//   // 1. 사용자 로그인
// //  final GoogleSignInAccount? googleUser = await GoogleSignIn(clientId: dotenv.get("GOOGLE_CLIENT_ID")).signIn();
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // 2. 인증 정보 가져오기
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//   if (googleAuth != null) {
//     // 3. Access Token과 ID Token 사용
//     final String accessToken = googleAuth.accessToken!;
//     final String idToken = googleAuth.idToken!;

//     print("Access Token: $accessToken");
//     print("ID Token: $idToken");
//   }
// }

import 'package:google_sign_in/google_sign_in.dart';

Future<void> googleLogin() async {
  //final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  try {
    // 구글 로그인 시도
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print("sign ok");
    if (googleUser == null) {
      print("Authentication failed");
      // 사용자가 로그인 취소
      return;
    }

    // 로그인 성공, 토큰을 받아오기
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // 토큰을 가져옴
    String? idToken = googleAuth.idToken;
    String? accessToken = googleAuth.accessToken;

    if (idToken != null) {
      print(idToken);
      print(accessToken);
    } else {
      print("Failed to get ID Token");
    }
  } catch (error) {
    print("Error during Google Sign-In: $error");
  }
}