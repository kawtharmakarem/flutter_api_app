import 'package:bloc/bloc.dart';
import 'package:flutter_api_app/api_result.dart';
import 'package:flutter_api_app/cubit/result_state.dart';
import 'package:flutter_api_app/my_repo.dart';
import 'package:flutter_api_app/network_exceptions.dart';
import 'package:meta/meta.dart';

import '../user.dart';

// part 'my_state.dart';

class MyCubit extends Cubit<ResultState<dynamic>> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(const Idle());

  void emitGetAllUsers() async {
    var data=await myRepo.getAllUsers();
    data.when(success: (List<User> users){
      emit(ResultState.success(users));
    }, failure: (NetworkExceptions networkExceptions){
     emit(ResultState.error(networkExceptions));
    });
    // myRepo.getAllUsers().then((usersList) {
    //   emit(GetAllUsers(usersList));
    // });
  }

  void emitGetUserDetails(int userId) async {
    var user=await myRepo.getUserById(userId);
    user.when(success: (User user){
      emit(ResultState.success(user));
    }, failure: (NetworkExceptions networkExceptions){
     emit(ResultState.error(networkExceptions));
    });
    // myRepo.getUserById(userId).then((userDetails) {
    //   emit(GetUserDetails(userDetails));
    // });
  }

  void emitCreateNewUser(User user) async{
    var userData=await myRepo.createNewUser(user);
    userData.when(success: (User user){
      emit(ResultState.success(user));
    }, failure: (networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });

    // myRepo.createNewUser(user).then((newUser) {
    //   emit(CreateNewUser(newUser));
    // });
  }

  // void emitDeleteUser(int userId) {
  //   myRepo.deleteUser(userId).then((data){
  //     return emit(DeleteUser(data));
  //   });
  // }
}
