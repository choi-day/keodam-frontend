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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: MAIN_TEXT_COLOR),
          onPressed: () {},
        ),
        title: const Text(
          '이용약관',
          style: TextStyle(color: MAIN_TEXT_COLOR),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              '커담 서비스를 이용하기 전,',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '약관 및 개인정보 취급방침 동의가 필요해요',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // 동의 항목들
            _buildAgreementOption(0, '개인정보 수집 및 이용 동의 (필수)'),
            const SizedBox(height: 10),
            _buildAgreementOption(1, '서비스이용약관 동의 (필수)'),
            const SizedBox(height: 10),
            _buildAgreementOption(2, '이벤트 및 혜택 알림 수신 동의 (선택)'),
            const SizedBox(height: 40),
            _buildAgreementOption(
              3,
              '모든 약관에 동의합니다.',
              isBold: true,
              isAllSelectedOption: true,
            ),
            const SizedBox(height: 30),
            const Text(
              '약관에 동의하지 않을 수 있지만,\n서비스 이용에 제한이 생기게 됩니다.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            // 시작하기 버튼
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // 버튼 눌렀을 때 동작
                    print(_selectedOptions);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MAIN_BACKGROUND_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '시작하기',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: MAIN_COLOR,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // 동의 항목 위젯
  Widget _buildAgreementOption(
    int index,
    String text, {
    bool isBold = false,
    bool isAllSelectedOption = false, // "모든 약관에 동의합니다" 여부
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (isAllSelectedOption) {
                // "모든 약관에 동의합니다"를 눌렀을 때
                final allSelected = !_selectedOptions[index];
                for (int i = 0; i < _selectedOptions.length - 1; i++) {
                  _selectedOptions[i] = allSelected;
                }
                _selectedOptions[index] = allSelected;
              } else {
                // 개별 항목을 눌렀을 때
                _selectedOptions[index] = !_selectedOptions[index];
              }
            });
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: MAIN_TEXT_COLOR, width: 2),
              color:
                  _selectedOptions[index] ? MAIN_COLOR : MAIN_BACKGROUND_COLOR,
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
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
