// import 'package:flutter/material.dart';
// import 'package:keodam_frontend/const/colors.dart';

// class AgreementDetail_screen extends StatelessWidget {
//   final String title;
//   final String content;

//   const AgreementDetail_screen({
//     super.key,
//     required this.title,
//     required this.content,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.chevron_left, color: MAIN_TEXT_COLOR),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         backgroundColor: MAIN_BACKGROUND_COLOR,
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(content),
//               const Spacer(),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: 60,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: MAIN_COLOR,
//                         disabledBackgroundColor: Colors.grey[300],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: const Text(
//                         '닫기',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:keodam_frontend/const/colors.dart';

class AgreementDetail_screen extends StatelessWidget {
  final String title;
  final String content;

  const AgreementDetail_screen({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: MAIN_BACKGROUND_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(10.0), // 패딩 추가하여 레이아웃 조정
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20, // ✅ 폰트 크기 조정
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  textAlign: TextAlign.start, // ✅ 본문 정렬
                  style: const TextStyle(fontSize: 14), // ✅ 가독성 향상
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ✅ 닫기 버튼
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MAIN_COLOR,
                      disabledBackgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      '닫기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30), // ✅ 하단 여백 조정
          ],
        ),
      ),
    );
  }
}
