import 'package:cubit_lesson/view_model/splash_changed/splash_changed_cubit.dart';
import 'package:cubit_lesson/view_model/users_cubit/users_cubit.dart';
import 'package:cubit_lesson/view_model/product_screen.dart/product_cubit.dart';
import 'package:cubit_lesson/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashChangedCubit()),
        BlocProvider(create: (_) => UsersCubit()),
        BlocProvider(create: (_) => CubitProduct()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: SplashScreen(),
      ),
    );
  }
}
