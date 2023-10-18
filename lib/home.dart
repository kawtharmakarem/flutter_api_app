import 'package:flutter/material.dart';
import 'package:flutter_api_app/cubit/my_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList=[];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MyCubit>(context).emitGetAllUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("HomeScreen"),
      ),
      body: Column(
        children: [
          BlocBuilder<MyCubit,MyState>(
            builder: (context,state){
             if(state is GetAllUsers){
              usersList=(state).allUsersList;
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(8.0),
                itemCount: usersList.length,
                itemBuilder: (BuildContext context,int index){
                 return Container(height: 50,
                 color: Colors.amber,
                 child: Text(usersList[index].name.toString(),));
              });
             }else{
              return const Center(child:CircularProgressIndicator());
             }
          })
        ],
      ),
    );
  }
}