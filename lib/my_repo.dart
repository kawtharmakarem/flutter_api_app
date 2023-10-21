import 'dart:io';

import 'user.dart';
import 'web_services.dart';

class MyRepo {
  final WebServices webServices;
  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    // var response = await webServices.getAllUsers();
    // return response.map((user) => User.fromJson(user.toJson())).toList();
    return await webServices.getAllUsers();
  }

  Future<User> getUserById(int userId) async {
    // var response=await webServices.getUserById(userId);
    // return User.fromJson(response.toJson());
    return await webServices.getUserById(userId);
  }

  Future<User> createNewUser(User user) async {
    return await webServices.createNewUser(user,
        'Bearer 30ff05265da7931c2c8eea2b3357a0e942f2c3b25d331997fcf927b832f6ed3c');
  }
  Future<dynamic> deleteUser(int id) async{
    return await webServices.deleteUser(id, 'Bearer 30ff05265da7931c2c8eea2b3357a0e942f2c3b25d331997fcf927b832f6ed3c');
  }
}
