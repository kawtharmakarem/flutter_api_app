import 'package:dio/dio.dart';
import 'package:flutter_api_app/cubit/my_cubit.dart';
import 'package:flutter_api_app/my_repo.dart';
import 'package:flutter_api_app/web_services.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;
void initGetIt(){
  getIt.registerLazySingleton<WebServices>(() => WebServices(Dio()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));

  
}

Dio createAndSetupDio() {
  Dio dio=Dio();
  dio
  ..options.connectTimeout=Duration(milliseconds: 10000)
  ..options.receiveTimeout=Duration(milliseconds: 100000);
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,

  ));
  return dio;

}