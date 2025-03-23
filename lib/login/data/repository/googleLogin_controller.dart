import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

final dio = Dio();
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
      await dio.post("http://keodam.kro.kr/auth/login", options: Options(headers: {"id_token": '${idToken}'}));
    } else {
      print("Failed to get ID Token");
    }
  } catch (error) {
    print("Error during Google Sign-In: $error");
  }
}