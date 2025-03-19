import 'package:flutter/material.dart';
import 'package:keodam_frontend/const/colors.dart';
import 'package:keodam_frontend/signup/data/constants/agreementText_constants.dart';
import 'package:keodam_frontend/signup/presentation/screens/agreementDetail_screen.dart';
import 'package:keodam_frontend/signup/presentation/widget/areement_widget.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  final List<bool> selectedOptions = [false, false, false, false];
  bool isAllSelected = false;

  void _onOptionTap(int index) {
    setState(() {
      if (index == 3) {
        final allSelected = !selectedOptions[3];
        for (int i = 0; i < selectedOptions.length - 1; i++) {
          selectedOptions[i] = allSelected;
        }
        selectedOptions[3] = allSelected;
        isAllSelected = allSelected;
      } else {
        selectedOptions[index] = !selectedOptions[index];
        selectedOptions[3] =
            selectedOptions[0] && selectedOptions[1] && selectedOptions[2];
        isAllSelected = selectedOptions[3];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: MAIN_TEXT_COLOR),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const Text(
                '커피와 담소 서비스의 원활한 이용을 위해,\n 약관 동의가 필요해요',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // ✅ "전체 동의" 배경색 변경
              Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: isAllSelected
                      ? const Color.fromARGB(255, 210, 228, 248)
                      : const Color.fromARGB(255, 237, 237, 237),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 15.0),
                  child: AgreementOption(
                    index: 3,
                    text: '전체 약관 동의하기 (선택 항목 포함)',
                    isBold: true,
                    isAllSelectedOption: true,
                    isUnderlined: false,
                    isSelected: selectedOptions[3],
                    onOptionTap: _onOptionTap, // ✅ 상태 변경 콜백 전달
                  ),
                ),
              ),
              const SizedBox(height: 40),

              AgreementOption(
                index: 0,
                text: '개인정보 수집 및 이용 동의 (필수)',
                isSelected: selectedOptions[0],
                onOptionTap: _onOptionTap,
                onTextTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AgreementDetailScreen(
                        title: AgreementText.privacyPolicyTitle,
                        content: AgreementText.privacyPolicyContent,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              AgreementOption(
                index: 1,
                text: '서비스이용약관 동의 (필수)',
                isSelected: selectedOptions[1],
                onOptionTap: _onOptionTap,
                onTextTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AgreementDetailScreen(
                        title: AgreementText.termsOfServiceTitle,
                        content: AgreementText.termsOfServiceContent,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              AgreementOption(
                index: 2,
                text: '이벤트 및 혜택 알림 수신 동의 (선택)',
                isSelected: selectedOptions[2],
                onOptionTap: _onOptionTap,
                onTextTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AgreementDetailScreen(
                        title: AgreementText.eventNotificationTitle,
                        content: AgreementText.eventNotificationContent,
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: selectedOptions[0] && selectedOptions[1]
                        ? () {
                            print("모든 필수 약관 동의 완료");
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MAIN_COLOR,
                      disabledBackgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      '시작하기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
