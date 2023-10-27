import 'package:dio/dio.dart';
import 'package:flutter_api_app/user.dart';
import 'package:retrofit/retrofit.dart';
    part 'web_services.g.dart';


@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')

abstract class WebServices{
factory WebServices(Dio dio,{String baseUrl})=_WebServices;


//all users
@GET('users')
  Future<List<User>> getAllUsers();

  //one user
  @GET('users/{id}')
  Future<User> getUserById(@Path('id') int userId);

//create user
//token form gorestsite:30ff05265da7931c2c8eea2b3357a0e942f2c3b25d331997fcf927b832f6ed3c
@POST('users')
Future<User> createNewUser(@Body() User user,@Header('Authorization') String token);

//delete user
@DELETE('users/{id}')
Future<HttpResponse> deleteUser(@Path() int id,@Header('Authorization') String token);
}



 
