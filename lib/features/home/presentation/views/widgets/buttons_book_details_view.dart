import '../../../../../core/utils/widgets/custom_book_button.dart';
import 'package:flutter/material.dart';

class ButtonsBook extends StatelessWidget {
  const ButtonsBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children: [
          Expanded(
            child: CustomBookButton(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16)),
              text: '19.99€',
              textColor: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: CustomBookButton(
              backgroundColor: Color(0xffEF8262),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16)),
              text: 'Free preview',
              textColor: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
