import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ma7fazty/layout/cubit/cubit.dart';
import 'package:ma7fazty/layout/home_layout.dart';
import 'package:ma7fazty/layout/splash_screen.dart';
import 'package:ma7fazty/shared/observer.dart';

void main() {
  BlocOverrides.runZoned(
        () {
      runApp( MyApp());
    },
    blocObserver: MyBlocObserver(),
  );}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>WalletlCubit()..createDatabase())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
