import 'package:flutter/material.dart';
import 'package:flutter_api_app/cubit/my_cubit.dart';
import 'package:flutter_api_app/home.dart';
import 'package:flutter_api_app/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  BlocProvider(
        create: (context) => getIt<MyCubit>(),
        child:const  HomeScreen(),
      ),
    );
  }
}
