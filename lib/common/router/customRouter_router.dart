import 'package:go_router/go_router.dart';
import 'package:keodam_frontend/common/constants/settingText.dart';
import 'package:keodam_frontend/signup/presentation/screens/agreementDetail_screen.dart';
import 'package:keodam_frontend/signup/presentation/screens/agreement_screen.dart';

class CustomRouter {
  static GoRouter router = GoRouter(initialLocation: "/agreement", routes: [
    GoRoute(
        path: "/agreement",
        builder: (context, state) => const AgreementScreen()),
    GoRoute(
      path: "/agreement/detail",
      builder: (context, state) {
        final data = state.extra as Map<String, String>? ?? {}; // 안전한 타입 변환
        final title = data['title'] ?? SettingText.errorText;
        final content = data['content'] ?? SettingText.errorText;

        return AgreementDetailScreen(title: title, content: content);
      },
    )
  ]);
}
