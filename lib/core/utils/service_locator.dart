import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_imple.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt
      .registerSingleton<HomeRepoImple>(HomeRepoImple(getIt.get<ApiService>()));

 

}

// in this file we use the get it library from flutter for singleton pattern.
// go to website and see the usage.
// <......> in this practs put what went to call or what went to get


//Broken any thank to simmer component.