import 'package:flutter/material.dart';
import 'package:flutter_api_app/cubit/my_cubit.dart';
import 'package:flutter_api_app/cubit/result_state.dart';
import 'package:flutter_api_app/network_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User user = User();
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    //BlocProvider.of<MyCubit>(context).emitGetUserDetails(628317);
    BlocProvider.of<MyCubit>(context).emitCreateNewUser(User(
        name: 'kawthar',
        email: 'kawtharrmakaremm@gmail.com',
        gender: 'female',
        status: 'Active'));
    //BlocProvider.of<MyCubit>(context).emitDeleteUser(5405560);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: Column(
        children: [
          // BlocBuilder<MyCubit,MyState>(
          //   builder: (context,state){
          //    if(state is GetAllUsers){
          //     usersList=(state).allUsersList;
          //     return ListView.builder(
          //       shrinkWrap: true,
          //       padding: EdgeInsets.all(8.0),
          //       itemCount: usersList.length,
          //       itemBuilder: (BuildContext context,int index){
          //        return Container(height: 50,
          //        color: Colors.amber,
          //        child: Text(usersList[index].name.toString(),));
          //     });
          //    }else{
          //     return const Center(child:CircularProgressIndicator());
          //    }
          // }),
          const SizedBox(
            height: 40,
          ),
          // BlocBuilder<MyCubit,MyState>(builder: (BuildContext context,MyState state){
          //   if(state is GetUserDetails){
          //     user=(state).userDetails;
          //     return Container(
          //       height: 50,
          //       color: Colors.amber,
          //       child: Center(child: Text(user.name.toString(),style:TextStyle(fontSize: 20))));
          //   }else{
          //     return Center(child: CircularProgressIndicator(),);
          //   }
          // }),
          BlocBuilder<MyCubit, ResultState<dynamic>>(
            builder: (context, ResultState<dynamic> state) {
              return state.when(idle: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, success: (dynamic userData) {
                userData = userData as User;
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(child: Text(userData.email.toString())),
                );
              }, error: (NetworkExceptions networkExceptions) {
                return Container(
                  child: Text(
                      NetworkExceptions.getErrorMessage(networkExceptions)),
                );
              });
            },

            //   builder: (context,state){
            //   if(state is CreateNewUser){
            //     user=(state).newUser;
            //     return Container(
            //     color: Colors.amber,
            //     child: Text(user.name.toString(),
            //     ));
            //   }else{
            //     return Center(child: CircularProgressIndicator(),);
            //   }
            //  }
          ),

          const SizedBox(
            height: 40,
          ),
          // BlocBuilder<MyCubit,MyState>(builder: (context,state){

          //   if(state is DeleteUser){
          //     return Container(
          //       height: 40,
          //       color: Colors.amber,
          //       child: Text((state).data.toString()),
          //     );
          //   }else{
          //     return Center(child: CircularProgressIndicator(),);
          //   }
          // }),
        ],
      ),
    );
  }
}
