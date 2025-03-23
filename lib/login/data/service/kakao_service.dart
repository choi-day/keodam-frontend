import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class KakaoService {
  static Future<void> initialize() async {
    await dotenv.load(fileName: 'assets/config/.env');
    String? kakaoNativeAppKey = dotenv.env['KAKAO_API_KEY'];
    String? javaScriptAppKey = dotenv.env['JAVASCRIPT_API_KEY'];

    KakaoSdk.init(
      nativeAppKey: kakaoNativeAppKey,
      javaScriptAppKey: javaScriptAppKey,
    );
  }
}