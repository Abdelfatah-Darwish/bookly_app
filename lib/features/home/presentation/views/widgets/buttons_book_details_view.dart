// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:bookly_app/core/utils/functions/launch_url.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/widgets/custom_book_button.dart';
import 'package:flutter/material.dart';

class ButtonsBook extends StatelessWidget {
  const ButtonsBook({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children: [
          const Expanded(
            child: CustomBookButton(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16)),
              text: 'Free',
              textColor: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: CustomBookButton(
              onPressed: () async {
                launchCustomUrl(context, bookModel.volumeInfo!.previewLink!);
              },
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  topRight: Radius.circular(16)),
              text: getText(bookModel),
              textColor: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    String? s = bookModel.volumeInfo?.previewLink;
    if (s == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
