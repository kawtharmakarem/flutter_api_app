import 'package:dio/dio.dart';
import 'package:flutter_api_app/user.dart';
import 'package:retrofit/retrofit.dart';
    part 'web_services.g.dart';


@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')

abstract class WebServices{
factory WebServices(Dio dio,{String baseUrl})=_WebServices;


//response
@GET('users')
  Future<List<User>> getAllUsers();

}



 