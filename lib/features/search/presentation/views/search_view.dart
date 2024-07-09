import 'package:bookly_app/core/repos/home_repo_imple.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/search/presentation/manager/search_result_cubit/search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SearchResultCubit(
            getIt.get<HomeRepoImple>(),
          ),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
