import 'package:flutter/material.dart';
import 'package:keodam_frontend/const/colors.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  // 각 항목의 선택 상태를 관리하는 리스트
  final List<bool> _selectedOptions = [false, false, false, false];
  bool _isAllSelected = false;
  final bool _isUnderlined = false;
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
              Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: _isAllSelected
                      ? const Color.fromARGB(255, 210, 228, 248)
                      : const Color.fromARGB(255, 237, 237, 237), // 배경색 변경
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 15.0),
                  child: _buildAgreementOption(3, '전체 약관 동의하기 (선택 항목 포함)',
                      isBold: true,
                      isAllSelectedOption: true,
                      isUnderlined: false),
                ),
              ),
              const SizedBox(height: 40),
              _buildAgreementOption(
                0,
                '개인정보 수집 및 이용 동의 (필수)',
                onTextTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              _buildAgreementOption(
                1,
                '서비스이용약관 동의 (필수)',
                onTextTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsOfServicePage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              _buildAgreementOption(
                2,
                '이벤트 및 혜택 알림 수신 동의 (선택)',
                onTextTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EventNotificationPage(),
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
                    onPressed: _selectedOptions[0] && _selectedOptions[1]
                        ? () {
                            // 버튼 눌렀을 때 동작
                            print("모든 필수 약관 동의 완료");
                          }
                        : null, // 비활성화
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

  // 동의 항목 위젯
  Widget _buildAgreementOption(
    int index,
    String text, {
    bool isBold = false,
    bool isAllSelectedOption = false,
    VoidCallback? onTextTap,
    bool isUnderlined = true,
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (isAllSelectedOption) {
                final allSelected = !_selectedOptions[index];
                for (int i = 0; i < _selectedOptions.length - 1; i++) {
                  _selectedOptions[i] = allSelected;
                }
                _selectedOptions[index] = allSelected;

                _isAllSelected = allSelected;
              } else {
                _selectedOptions[index] = !_selectedOptions[index];
                _selectedOptions[3] = _selectedOptions[0] &&
                    _selectedOptions[1] &&
                    _selectedOptions[2];

                _isAllSelected = _selectedOptions[3];
              }
            });
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                  color: const Color.fromARGB(255, 130, 130, 130), width: 0),
              color: _selectedOptions[index]
                  ? MAIN_COLOR
                  : const Color.fromARGB(255, 207, 207, 207),
            ),
            child: _selectedOptions[index]
                ? const Icon(
                    Icons.check,
                    color: MAIN_BACKGROUND_COLOR,
                    size: 16,
                  )
                : null,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onTextTap, // 텍스트 클릭 시 동작
          child: Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                decoration: isUnderlined
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 약관 관련 페이지 예제
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('개인정보 수집 및 이용 동의'),
      ),
      body: const Center(
        child: Text('개인정보 수집 및 이용 동의 내용'),
      ),
    );
  }
}

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('서비스 이용약관 동의'),
      ),
      body: const Center(
        child: Text('서비스 이용약관 동의 내용'),
      ),
    );
  }
}

class EventNotificationPage extends StatelessWidget {
  const EventNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이벤트 및 혜택 알림 수신 동의'),
      ),
      body: const Center(
        child: Text('이벤트 및 혜택 알림 수신 동의 내용'),
      ),
    );
  }
}
