import 'featured_list_view_item.dart';
import 'package:flutter/material.dart';

class DetailsBookListView extends StatelessWidget {
  const DetailsBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.13,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: CustomBookImage(aspectRatio: 5 / 8, imageUrl: 'https://images.pexels.com/photos/26631544/pexels-photo-26631544/free-photo-of-birds.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',),
            );
          },
        ),
      ),
    );
  }
}
