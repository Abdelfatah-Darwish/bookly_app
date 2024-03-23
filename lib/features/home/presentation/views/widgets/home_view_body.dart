import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_app_bar.dart';
import 'featured_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        FuturedBoxListView(),
      ],
    );
  }
}

class FuturedBoxListView extends StatelessWidget {
  const FuturedBoxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: FeaturedListViewItem(),
          );
        },
      ),
    );
  }
}
