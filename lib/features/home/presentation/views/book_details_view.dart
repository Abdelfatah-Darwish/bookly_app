import 'widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetialsView extends StatelessWidget {
  const BookDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: BookDetialsViewBody()),
    );
  }
}
