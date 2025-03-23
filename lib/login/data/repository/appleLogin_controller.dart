import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<void> appleLogin() async {
  final credential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
  );

  print(credential);
}