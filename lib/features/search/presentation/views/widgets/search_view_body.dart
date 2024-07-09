import 'package:bookly_app/features/search/presentation/manager/search_result_cubit/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import 'search_result_list_view.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSubmitted: (query) {
              context.read<SearchResultCubit>().fetchSearchResult(query);
            },
          ),
          const SizedBox(height: 15),
          const Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(height: 15),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
