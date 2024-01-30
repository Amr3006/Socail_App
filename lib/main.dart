
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/BloCs%20and%20Cubits/App%20Cubit/app_cubit.dart';
import 'package:social_app/Design/Themes.dart';
import 'package:social_app/Screens/homeLayout.dart';
import 'package:social_app/Screens/loginScreen.dart';
import 'package:social_app/Shared/CacheHelper.dart';
import 'package:social_app/Shared/Variables%20and%20Constants.dart';

import 'BloC Observer.dart';

Widget startingScreen() {
  uId = cacheHelper.getData(key: "uId");
  if (uId == null) {
    return LoginScreen();
  }
  return const HomeLayout();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await cacheHelper.init();
  runApp(const MyApp());
  print("jf");
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
      ..getPosts()
      ..getUser()
      ..getChats(),
      child: MaterialApp(
        home: startingScreen(),
        debugShowCheckedModeBanner: false,
        theme: whiteTheme,
      ),
    );
  }
}
