import 'dart:io';

import 'package:flutter_api_app/network_exceptions.dart';
import 'package:retrofit/dio.dart';

import 'api_result.dart';
import 'user.dart';
import 'web_services.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);

  Future<ApiResult<List<User>>> getAllUsers() async {
    try{
      var response=await webServices.getAllUsers();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
    
    // var response = await webServices.getAllUsers();
    // return response.map((user) => User.fromJson(user.toJson())).toList();
    //return await webServices.getAllUsers();
  }

  Future<ApiResult<User>> getUserById(int userId) async {
    try{
       var response=await webServices.getUserById(userId);
       return ApiResult.success(response);

    }catch(error){
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
   

    // var response=await webServices.getUserById(userId);
    // return User.fromJson(response.toJson());
   // return await webServices.getUserById(userId);
  }
  Future<ApiResult<User>> createNewUser(User user) async{
    try{
      var response=await webServices.createNewUser(user,
      'Bearer 30ff05265da7931c2c8eea2b3357a0e942f2c3b25d331997fcf927b832f6ed3c');
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  // Future<User> createNewUser(User user) async {
  //   return await webServices.createNewUser(user,
  //       'Bearer 30ff05265da7931c2c8eea2b3357a0e942f2c3b25d331997fcf927b832f6ed3c');
  // }
  // Future<HttpResponse> deleteUser(int id) async{
  //   return await webServices.deleteUser(id, 'Bearer 30ff05265da7931c2c8eea2b3357a0e942f2c3b25d331997fcf927b832f6ed3c');
  // }
}
