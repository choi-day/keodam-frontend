import 'package:flutter/material.dart';
import 'package:keodam_frontend/const/colors.dart';

class AgreementOption extends StatelessWidget {
  final int index;
  final String text;
  final bool isBold;
  final bool isAllSelectedOption;
  final VoidCallback? onTextTap;
  final bool isUnderlined;
  final bool isSelected;
  final Function(int) onOptionTap;

  const AgreementOption({
    super.key,
    required this.index,
    required this.text,
    required this.isSelected,
    required this.onOptionTap,
    this.isBold = false,
    this.isAllSelectedOption = false,
    this.onTextTap,
    this.isUnderlined = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onOptionTap(index),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: const Color.fromARGB(255, 130, 130, 130),
                width: 0,
              ),
              color: isSelected
                  ? MAIN_COLOR
                  : const Color.fromARGB(255, 207, 207, 207),
            ),
            child: isSelected
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
          child: GestureDetector(
            onTap: onTextTap,
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
