// ignore_for_file: avoid_print, use_build_context_synchronously

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
              text: '19.99€',
              textColor: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: CustomBookButton(
              onPressed: () async {
                final Uri url = Uri.parse(bookModel.volumeInfo!.previewLink!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  // Handle the error here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch $url')),
                  );
                }
              },
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
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
