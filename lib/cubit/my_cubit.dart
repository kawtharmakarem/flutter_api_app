import 'package:bloc/bloc.dart';
import 'package:flutter_api_app/my_repo.dart';
import 'package:meta/meta.dart';

import '../user.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(MyInitial());

  void emitGetAllUsers() {
    myRepo.getAllUsers().then((usersList) {
      emit(GetAllUsers(usersList));
    });
  }

  void emitGetUserDetails(int userId) {
    myRepo.getUserById(userId).then((userDetails) {
      emit(GetUserDetails(userDetails));
    });
  }

  void emitCreateNewUser(User user) {
    myRepo.createNewUser(user).then((newUser) {
      emit(CreateNewUser(newUser));
    });
  }

  void emitDeleteUser(int userId) {
    myRepo.deleteUser(userId).then((data){
      return emit(DeleteUser(data));
    });
  }
}
